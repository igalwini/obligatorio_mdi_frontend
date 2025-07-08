import React from 'react';
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { UserProvider } from "./UserContext";
import NavBar from "./NavBar";
import Home from "./Home";
import Profile from "./Profile";
import Settings from "./Settings";
import "./App.css";

function App() {
  return (
    <UserProvider>
      <Router>
        <div className="app-container">
          <NavBar />
          <main className="main-content">
            <Routes>
              <Route path="/" element={<Home />} />
              <Route path="/profile" element={<Profile />} />
              <Route path="/settings" element={<Settings />} />
            </Routes>
          </main>
        </div>
      </Router>
    </UserProvider>
  );
}

export default App;
