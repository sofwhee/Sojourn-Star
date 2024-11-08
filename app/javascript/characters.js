function expandImage(modal, modalimg) {
  modal.style.display = "block"
  modalimg.src = this.src;
}

const chars = Array.from(document.getElementsByClassName("charinfo"))
const modal = document.getElementById("overlay")
const modalimg = document.getElementById("overlayimg")

chars.forEach((char) => {
  char.onclick = expandImage(modal, modalimg)
});

// modal.onclick = function() {
//   modal.style.display = "none";
// }