import React from "react";
import "./CustomButton.css";

const CustomButton = ({ children, onClick, type = "button" }) => (
  <button className="custom-btn" type={type} onClick={onClick}>
    {children}
  </button>
);

export default CustomButton;
