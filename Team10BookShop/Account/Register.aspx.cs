using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Team10BookShop;

namespace Team10BookShop.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            captcha1.ValidateCaptcha(TxtCaptcha.Text.Trim());

            if (!captcha1.UserValidated)
            {

                ErrorMessage.Text = "لطفا مقدار داخل کادر را به طور صحیح وارد کنید";
                return;
            }

            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);
            
            if (result.Succeeded)
            {
                // For more information on how to enable account confirmation and password reset please visit https://go.microsoft.com/fwlink/?LinkID=320771
                string code = manager.GenerateEmailConfirmationToken(user.Id);
                string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                manager.SendEmail(user.Id, "فعالسازی حساب کاربری", "<h3>انتشارات سیماک - لطفا برای فعالسازی حساب کاربری خود روی فعالسازی کلیک کنید <a href=\"" + callbackUrl + "\">فعالسازی حساب کاربری</a></h3>");
                ErrorMessage.Text = "لطفا برای فعالسازی حساب کاربری به ایمیل خود مراجعه کنید<br/>درصورتی که ایمیل فعالسازی را در صندوق پیام خود نمی بینید به پوشه spam مراجعه کنید";
                //signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                //if (Request.QueryString["ReturnUrl"] == null)
                //{
                //    var ReturnUrl = "~/Default.aspx";
                //    IdentityHelper.RedirectToReturnUrl(ReturnUrl, Response);
                //}
                //else
                //    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);

            }
            else 
            {
               if( result.Errors.FirstOrDefault().StartsWith("Name"))
                {
                    ErrorMessage.Text = "این ایمیل قبلا در  سامانه ثبت شده است";
                }
                else if(result.Errors.FirstOrDefault().StartsWith("Passwords"))
                {
                    ErrorMessage.Text = "رمز عبور باید حداقل شامل 4 کاراکتر باشد";
                }
                else
                {
                    ErrorMessage.Text = result.Errors.FirstOrDefault();
                }
            
               
            }
        }
    }
}