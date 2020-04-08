window.onload = function(){
  let charge = document.getElementById('charge');
  let profit = document.getElementById('profit');
};
function keisan($this){
  charge1 = Math.floor($this.value * 0.1);
  charge.innerHTML = "¥" + charge1;
  profit1 = $this.value - charge1;
  profit.innerHTML = "¥" + profit1;
};