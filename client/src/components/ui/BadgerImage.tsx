import { type FC } from "react";

export const BadgerImage: FC<{
  isError?: boolean;
}> = ({ isError = false }) => {
  if (isError) {
    return (
      <div className="text-center my-2">
        <img src="/badger_error.png" alt="badger" height={150} />
      </div>
    );
  }
  const badgers = ["/badger_sleeping.png", "/badger_upright.png"];
  const randomBadger = badgers[Math.floor(Math.random() * badgers.length)];
  return (
    <div className="text-center mt-2">
      <img src={randomBadger} alt="badger" height={150} />
    </div>
  );
};
