<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class JobInterviewNotification extends Notification implements ShouldQueue
{
    use Queueable;
    public $interview;

	/**
	 * Create a new notification instance.
	 *
	 * @param $interview
	 */
    public function __construct($interview)
    {
        //
		$this->interview = $interview;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
		return (new MailMessage)
            ->greeting('Parabéns!')
            ->subject('Convite para Entrevista')
            ->line('Prezado(a) Sr./Sra.')
            ->line('Você foi selecionado(a) para a vaga de ' . $this->interview->InterviewJob->job_title . '. Portanto, solicitamos que compareça à nossa sessão de entrevista conforme o seguinte agendamento e local.')
            ->line('Data e Hora: ' . $this->interview->interview_date . ' | ' . $this->interview->interview_time)
            ->line('Local: ' . $this->interview->interview_place)
            ->line($this->interview->description)
            ->line('Agradecemos a sua atenção.');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
//    public function toArray($notifiable)
//    {
//        return [
//            //
//        ];
//    }
}
