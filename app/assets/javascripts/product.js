function setPrice() {
  var weight = document.getElementById("weight").value;
  if(weight == "") {
    document.getElementById("price").innerHTML = "Rs. 00";
  }
  else {
    var price = parseFloat(weight)*3;
    document.getElementById("price").innerHTML = "Rs. " +price;
  }
}