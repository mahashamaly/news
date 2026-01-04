
//on DateTime? تعني إن هذا الـ extension مطبق على النوع DateTime أو DateTime؟
extension  DateTimeFormatter on DateTime{
  String formatDateTime(){
  
   final diff=DateTime.now().difference(this);
   //لو الوقت الماضي أقل من ساعة → رجّع عدد الدقائق
   if(diff.inMinutes<60){
    return "${diff.inMinutes}m ago";
   }
   //لو الوقت بين ساعة و24 ساعة → رجع عدد الساعات.
   if(diff.inHours<24){
    return "${diff.inHours}h ago";
   }
   //لو مرّ أكثر من يوم → رجع عدد الأيام.
   return"${diff.inDays} d ago ";
  }




  }

