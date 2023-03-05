using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Team10BookShop;

namespace Team10BookShop.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register";
            //Enable this once you have account confirmation enabled for password reset functionality
            //ForgotPasswordHyperLink.NavigateUrl = "Forgot";
            //OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }

        protected void LogIn(object sender, EventArgs e)
        {
            var ReturnUrl = "";
            if (Request.QueryString["ReturnUrl"] == null)
            {
                ReturnUrl = "~/Default.aspx";
            }
            else
            {
                ReturnUrl = Request.QueryString["ReturnUrl"];
            }

            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);

            if (IsValid)
            {


                captcha1.ValidateCaptcha(TxtCaptcha.Text.Trim());

                if (!captcha1.UserValidated)
                {

                    FailureText.Text = "لطفا مقدار داخل کادر را به طور صحیح وارد کنید";
                    ErrorMessage.Visible = true;
                    return;
                }


                // Validate the user password
                var usermanager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

                // This doen't count login failures towards account lockout
                // To enable password failures to trigger lockout, change to shouldLockout: true
                if (signinManager.UserManager.FindByEmail(Email.Text) != null)
                {
                    var userid = usermanager.FindByEmail(Email.Text).Id;
                    if (!usermanager.IsEmailConfirmed(userid))
                    {
                        FailureText.Text = "لطفا ابتدا حساب کاربری خود را از طریق ایمیل ارسال شده هنگام ثبت نام فعال کنید";
                        ErrorMessage.Visible = true;
                        return;
                    }
                }

                var result = signinManager.PasswordSignIn(Email.Text, Password.Text, RememberMe.Checked, shouldLockout: false);
                switch (result)
                {
                    case SignInStatus.Success:
                        IdentityHelper.RedirectToReturnUrl(ReturnUrl, Response);
                        //Page.Response.Redirect("~/Account/Login?ReturnUrl=~/Browsing");
                        //if (User.IsInRole("Owner"))
                        //{
                        //    Session["userLogged"] = "Owner";
                        //}
                        break;
                    case SignInStatus.LockedOut:
                        Response.Redirect("/Account/Lockout");
                        break;
                    case SignInStatus.RequiresVerification:
                        Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}",
                                                        Request.QueryString["ReturnUrl"],
                                                        RememberMe.Checked), true);
                        break;
                    case SignInStatus.Failure:
                    default:
                        FailureText.Text = "تلاش ناموفق برای ورود";
                        ErrorMessage.Visible = true;
                        break;
                }

            }
        }
    }
}