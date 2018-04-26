function myDateFormatter(date){  
         var y = date.getFullYear();  
         var m = date.getMonth()+1;  
         var d = date.getDate();  
         return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);  
}  

function myAddDate(addDay){
		var now=new Date();
		var result=new Date(now);
        result.setDate(now.getDate()+addDay);
        return result;
 }

function myDateTimeFormatter(date){  
    var y = date.getFullYear();  
    var m = date.getMonth()+1;  
    var d = date.getDate();
    var h=  date.getHours();
    var min=date.getMinutes();
    var s=date.getSeconds();
    return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d)+' '+(h<10?('0'+h):h)+':'+(min<10?('0'+min):min)+':'+(s<10?('0'+s):s);  
} 


if (typeof Array.prototype.forEach != 'function') {
    Array.prototype.forEach = function(callback){
      for (var i = 0; i < this.length; i++){
        callback.apply(this, [this[i], i, this]);
      }
    };
}