import React from "react";
import { useUser } from "./UserContext";
import { useNavigate } from "react-router-dom";
import CustomButton from "./CustomButton";

const Profile = () => {
  const { user } = useUser();
  const navigate = useNavigate();

  const handleGoToSettings = () => {
    navigate("/settings", { state: { user } });
  };

  return (
    <div>
      <h2>Profile</h2>
      <p><strong>Name:</strong> {user.name}</p>
      <p><strong>Email:</strong> {user.email}</p>
      <CustomButton onClick={() => { console.log("Botón presionado"); handleGoToSettings(); }}>
        Edit in Settings
      </CustomButton>
    </div>
  );
};

export default Profile;
