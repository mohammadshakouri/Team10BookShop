using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;
using System.Data;

namespace Team10BookShop.Tools
{
    public static class ConvertTools
    {
        public static string TOShamsi(this DateTime date)
        {
            string shamsidate = "";
            PersianCalendar pc = new PersianCalendar();
            shamsidate += pc.GetDayOfMonth(date);
            int mount = pc.GetMonth(date);
            string mountname="";
            switch(mount)
            {
                case 1: mountname = "فروردین"; break;
                case 2: mountname = "اردیبهشت"; break;
                case 3: mountname = "خرداد "; break;
                case 4: mountname = "تیر"; break;
                case 5: mountname = "مرداد"; break;
                case 6: mountname = "شهریور"; break;
                case 7: mountname = "مهر"; break;
                case 8: mountname = "آبان"; break;
                case 9: mountname = "آذر"; break;
                case 10: mountname = "دی"; break;
                case 11: mountname = "بهمن"; break;
                case 12: mountname = "اسفند"; break;

            }
            shamsidate += " ";
            shamsidate += mountname.ToString();
            shamsidate += " ";
            shamsidate += pc.GetYear(date);
            shamsidate += " ";
            shamsidate += "ساعت";
            shamsidate += " ";
            shamsidate += pc.GetHour(date).ToString("D2");
            shamsidate += ":";
            shamsidate += pc.GetMinute(date).ToString("D2");
            return shamsidate;
        }

    }
}