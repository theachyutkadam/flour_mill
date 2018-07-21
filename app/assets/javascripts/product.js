function setPrice() {
  var weight = document.getElementById("weight").value;
  var rate = document.getElementById("rate").value;
  if(weight == "" && rate == "") {
    document.getElementById("price").innerHTML = "Rs. 00";
    // document.getElementById("rate").innerHTML = "Rs. 00";
  }
  else {
    var price = parseFloat(weight) * parseFloat(rate);
    document.getElementById("price").innerHTML = "Rs. " +price;
  }
}

function showRate() {
  var item_id = document.getElementById("product_product_name").value;
  url = "/items/" + item_id + ".json"
  $.ajax({url: url, success: function(result){
    console.log(result.item.rate);
    rate = result.item.rate
    document.getElementById("rate").value = rate;
   }
  });
}