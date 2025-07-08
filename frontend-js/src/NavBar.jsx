import React from "react";
import { NavLink } from "react-router-dom";
import "./NavBar.css";

const NavBar = () => {
  return (
    <nav className="navbar">
      <NavLink to="/" end className={({ isActive }) => isActive ? "active" : undefined}>
        Home
      </NavLink>
      <NavLink to="/profile" className={({ isActive }) => isActive ? "active" : undefined}>
        Profile
      </NavLink>
      <NavLink to="/settings" className={({ isActive }) => isActive ? "active" : undefined}>
        Settings
      </NavLink>
    </nav>
  );
};

export default NavBar;
