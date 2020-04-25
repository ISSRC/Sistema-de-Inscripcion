using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;

namespace Sistema_de_Inscripcion
{
    public class CCorreo
    {
        Boolean estado = true;
        string merror;

        public CCorreo(string destinatario, string asunto, string mensaje)
        {
            MailMessage correo = new MailMessage();
            SmtpClient protocolo = new SmtpClient();

            correo.To.Add(destinatario);
            correo.From = new MailAddress("ElMeesmo35@gmail.com", "Instituto Superior Santa Rosa de Calamuchita", System.Text.Encoding.UTF8);
            correo.Subject = asunto;
            correo.SubjectEncoding = System.Text.Encoding.UTF8;
            correo.Body = mensaje;
            correo.BodyEncoding = System.Text.Encoding.UTF8;
            correo.IsBodyHtml = false;
            

            protocolo.Credentials = new System.Net.NetworkCredential("elmeesmo35@gmail.com", "maindvapapa");
            protocolo.Port = 25;
            protocolo.Host = "smtp.gmail.com";
            protocolo.EnableSsl = true;


            try
            {
                protocolo.Send(correo);
            }
            catch (SmtpException error)
            {
                estado = false;
                merror = error.Message.ToString();
            }


        }
        public Boolean Estado
        {
            get { return estado; }
        }
        public string mensaje_error
        {
            get { return merror; }
        }
    }
}