function expandImage(modal, modalimg) {
  modal.style.display = "block"
  modalimg.src = this.src;
}

const chars = Array.from(document.getElementsByClassName("charinfo"))
const modal = document.getElementById("overlay")
const modalimg = document.getElementById("overlayimg")

chars.forEach((char) => {
  char.onclick = function() {
    modal.style.display = "block"
    modalimg.src = this.src;
  }}
);

modal.onclick = function() {
  modal.style.display = "none"
}

console.log(chars[0].src)

// modal.onclick = function() {
//   modal.style.display = "none";
// }