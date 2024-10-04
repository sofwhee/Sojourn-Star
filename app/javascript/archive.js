// dict: divOpen, key (chapter num) value (true/false)
// when chapter is clicked

const chaptersOpen = {};
const chapterElements = document.getElementsByClassName("chaptertitle")

console.log(chapterElements)

Array.from(chapterElements).forEach((chapt) => {
  chaptersOpen[chapt.innerText] = {
    opened:false, 
    initHeight:0}
});

console.log(chaptersOpen)

function slideToggle(slidingElement) {
  var chapter = chaptersOpen[slidingElement.id]
  console.log(chapter)
  console.log(chapter.opened)

  if(chapter.opened) {
    chapter.opened = false;
    slidingElement.style.height = '0px';
  }
  else {
    chapter.opened = true;
    slidingElement.style.height = chapter.initHeight + 'px';
  }
}