window.onload = function(){
  let charge = document.getElementById('charge');
  let profit = document.getElementById('profit');
};
function keisan($this){
  charge.innerHTML = Math.floor($this.value * 0.1);
  profit.innerHTML = $this.value - charge.innerHTML;
};