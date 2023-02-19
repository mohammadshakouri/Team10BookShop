using System;
using System.Web;
using System.Web.Providers.Entities;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Team10BookShop;

namespace Team10BookShop.Account
{
    public partial class ForgotPassword : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Forgot(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Validate the user's email address
                var manager =  Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                ApplicationUser user = manager.FindByName(Email.Text);
                if (user == null || !manager.IsEmailConfirmed(user.Id))
                {
                    FailureText.Text = "کاربر مورد نظر یافت نشده و یا ایمیل آن تأیید نشده است";
                    ErrorMessage.Visible = true;
                    return;
                }
                // For more information on how to enable account confirmation and password reset please visit https://go.microsoft.com/fwlink/?LinkID=320771
                // Send email with the code and the redirect to reset password page
                string code = manager.GeneratePasswordResetToken(user.Id);
                string callbackUrl = IdentityHelper.GetResetPasswordRedirectUrl(code, Request);
                manager.SendEmail(user.Id, "بازیابی رمز عبور", "<h3>انتشارات سیماک - لطفا برای بازیابی رمز عبور روی لینک مقابل کلیک کنید <a href=\"" + callbackUrl + "\">بازیابی رمز عبور</a></h3>");
                loginForm.Visible = false;
                DisplayEmail.Visible = true;
            }
        }
        
    }
}

