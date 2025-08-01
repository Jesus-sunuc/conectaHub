import { Suspense } from "react";
import { useCategoryQuery } from "../hooks/CategoryHooks";
import { Spinner } from "../components/ui/Spinner";

const CategoriesSection = () => {
  const { data: categories } = useCategoryQuery();

  return (
    <div className="mt-4">
      <h2 className="h4 mb-3">Business Categories</h2>
      <p className="text-muted mb-3">
        Discover various business categories available in our platform:
      </p>
      <div className="row">
        {categories.map((category, index) => (
          <div key={category.slug || index} className="col-md-6 col-lg-4 mb-3">
            <div className="card h-100">
              <div className="card-body">
                <div className="d-flex align-items-center mb-2">
                  {category.iconUrl && (
                    <img
                      src={category.iconUrl}
                      alt={`${category.name} icon`}
                      className="me-2"
                      style={{ width: "24px", height: "24px" }}
                      onError={(e) => {
                        (e.target as HTMLImageElement).style.display = "none";
                      }}
                    />
                  )}
                  <h5 className="card-title mb-0">{category.name}</h5>
                </div>
                <p className="card-text text-muted small">
                  {category.description}
                </p>
                <span className="badge bg-secondary">{category.slug}</span>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

const About = () => {
  return (
    <div className=" py-4">
      <div className="row">
        <div className="col-lg-8 mx-auto">
          <h1 className="display-4 mb-4">About ConectaHub</h1>
          <p className="lead">
            ConectaHub is a comprehensive platform that connects businesses and
            customers, making it easier to discover and engage with local
            services and products.
          </p>
          <p>
            Our mission is to create a vibrant ecosystem where businesses can
            showcase their offerings and customers can find exactly what they're
            looking for, all in one convenient location.
          </p>

          <Suspense
            fallback={
              <div className="text-center py-4">
                <Spinner />
              </div>
            }
          >
            <CategoriesSection />
          </Suspense>
        </div>
      </div>
    </div>
  );
};

export default About;
