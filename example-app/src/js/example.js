import { PhotoAnnotator } from 'photo-annotator';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    PhotoAnnotator.echo({ value: inputValue })
}
