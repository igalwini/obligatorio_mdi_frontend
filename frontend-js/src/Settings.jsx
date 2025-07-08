import React from "react";
import { useLocation } from "react-router-dom";
import { useUser } from "./UserContext";
import CustomButton from "./CustomButton";

const Settings = () => {
  const { user, setUser } = useUser();
  const location = useLocation();
  const profileData = location.state?.user;

  const [form, setForm] = React.useState(profileData || user);

  const handleChange = (e) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  return (
    <div>
      <h2>Settings</h2>
      <form
        onSubmit={(e) => {
          e.preventDefault();
          setUser(form);
          console.log("Botón presionado");
        }}
      >
        <div>
          <label>Name: </label>
          <input name="name" value={form.name} onChange={handleChange} />
        </div>
        <div>
          <label>Email: </label>
          <input name="email" value={form.email} onChange={handleChange} />
        </div>
        <CustomButton type="submit">Save</CustomButton>
      </form>
    </div>
  );
};

export default Settings;
