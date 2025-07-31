import Carousel from "../components/Carousel";

const Home = () => {
  const images = ["./img1.jpg", "./img2.jpg", "./img3.jpg"];

  return (
    <div className="container mt-4">
      <Carousel id="homeCarousel" images={images} height="250px" />
    </div>
  );
};
export default Home;
