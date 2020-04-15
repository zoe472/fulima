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

$(function() {
  // 「imageList」内の「img」をマウスオーバーした場合
  $('#imageList img').hover(function(){
    // マウスオーバーしている画像をメインの画像に反映
    $('#mainImage img').attr('src', $(this).attr('src'));
    $((this).classList.contains("action"));
    $((this).classList.toggle("action"));
  });
});