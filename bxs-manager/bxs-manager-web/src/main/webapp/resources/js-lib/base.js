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


if (typeof Array.prototype.forEach != 'function') {
    Array.prototype.forEach = function(callback){
      for (var i = 0; i < this.length; i++){
        callback.apply(this, [this[i], i, this]);
      }
    };
}