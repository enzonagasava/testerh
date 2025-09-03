<?php

namespace App\Http\Controllers\Addon;

use App\Http\Controllers\Controller;
use App\Http\Requests\CRMInstallationRequest;
use App\Http\traits\ENVFilePutContent;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use ZipArchive;

class CRMController extends Controller
{
    use ENVFilePutContent;

    public function crmInstallStep1()
    {
        return view('addons.crm.step_1');
    }

    public function crmInstallStep2()
    {
        return view('addons.crm.step_2');
    }
    public function crmInstallStep3()
    {
        return view('addons.crm.step_3');
    }

    public function crmInstallProcess(CRMInstallationRequest $request)
    {

        $isPurchaseVerified = self::purchaseVerify($request->purchasecode);

        if (!$isPurchaseVerified->codecheck) {
            return redirect()->back()->withErrors(['errors' => ['Wrong Purchase Code !']]);
        }

        try {
            $data = self::fileReceivedFromAuthorServer($isPurchaseVerified->authorServerURL);
            if(!$data['isReceived']) {
                throw new Exception("The file transfer has failed. Please try again later.", 1);
            }
            self::fileUnzipAndDeleteManage($data);
            self::migrateCRMDatabase();
            Artisan::call('optimize:clear');

        } catch (Exception $e) {

            return redirect()->back()->withErrors(['errors' => [$e->getMessage()]]);
        }

        return redirect('/addons/crm/install/step-4');
    }



    protected static function purchaseVerify(string $purchaseCode) : object
    {
        $url = 'https://peopleprohrm.com/purchaseverify_crm/';
        $post_string = 'purchasecode='.urlencode($purchaseCode);
        $ch = curl_init();
        curl_setopt($ch,CURLOPT_URL, $url);
        curl_setopt($ch,CURLOPT_POST, true);
        curl_setopt($ch,CURLOPT_POSTFIELDS, $post_string);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        $result = curl_exec($ch);
        $object = new \stdClass();
        $object = json_decode(strip_tags($result));
        curl_close($ch);

        return $object;
    }

    protected static function fileReceivedFromAuthorServer(string $authorServerURL): array
    {
        $remoteFileName = pathinfo($authorServerURL)['basename'];
        $localFile = base_path('/'.$remoteFileName);
        $isCopied  = copy($authorServerURL, $localFile);

        return [
            'isReceived' => $isCopied,
            'remoteFileName' => $remoteFileName,
        ];
    }

    protected static function fileUnzipAndDeleteManage(array $data): void
    {
        if ($data['isReceived']) {
            $zip = new ZipArchive;
            self::unzipAndDeleteProcessing($zip, $data['remoteFileName']);
       }
    }

    protected static function unzipAndDeleteProcessing($zip, string $fileName): void
    {
        $file = base_path($fileName);
        $res = $zip->open($file);
        if ($res === TRUE) {
           $zip->extractTo(base_path());
           $zip->close();

           // ****** Delete Zip File ******
           File::delete($file);
        }
    }

    protected static function migrateCRMDatabase(): void
    {
        Artisan::call('module:migrate CRM');
        Artisan::call('module:seed --class=PermissionSeeder CRM');
    }

    public function crmInstallStep4()
    {
        return view('addons.crm.step_4');
    }

}
