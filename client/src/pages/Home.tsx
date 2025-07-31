import Card from "../components/Card";
import Carousel from "../components/Carousel";

const Home = () => {
  const images = ["./img1.jpg", "./img2.jpg", "./img3.jpg"];

  return (
    <div className="container mt-4">
      <div className="row">
        <Carousel id="homeCarousel" images={images} height="250px" />
      </div>
      <div className="container py-4">
        <div className="row g-4">
          <div className="col-12 col-sm-6 col-md-4 col-lg-3">
            <Card />
          </div>
        </div>
      </div>
    </div>
  );
};
export default Home;
