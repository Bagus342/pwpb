class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Pictpo Application',
      image: 'images/1.svg',
      discription: "Pictpo is a provider of HD quality images."
          "In the Pictpo application you can download and upload images. "
          "What are you waiting for use pictpo to have a nice day,"),
  UnbordingContent(
      title: 'Download Pictures',
      image: 'images/2.svg',
      discription: "In the Pictpo application you can download images."
          "Download images in separate categories."
          "Of course, this application provides images of the highest quality."),
  UnbordingContent(
      title: 'Upload Picture',
      image: 'images/3.svg',
      discription: "You can also upload the best image you have."
          "Make sure to upload the best quality images"
          "So that others can enjoy your work with wow quality"),
];
