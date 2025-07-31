const Card = () => {
  return (
    <div
      className="card h-100 border-1 shadow-sm rounded-4 overflow-hidden"
      style={{ width: "100%", maxWidth: "20rem" }}
    >
      <img
        src="./card.jpg"
        className="card-img-top object-fit-cover"
        alt="Business Image"
        style={{ height: "200px" }}
      />
      <div className="card-body d-flex flex-column justify-content-between">
        <div>
          <h5 className="card-title text-primary mb-1">Business Name</h5>
          <p className="card-text text-muted small">
            Short description about the business goes here. Keep it brief and
            clear.
          </p>
        </div>
        <a href="#" className="btn btn-outline-primary mt-3 w-100">
          View Profile
        </a>
      </div>
    </div>
  );
};

export default Card;
