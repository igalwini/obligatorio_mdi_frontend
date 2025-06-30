import React, { useState } from 'react';
import './Sidebar.css';

const Sidebar = ({ onSelect }) => {
  const [activeItem, setActiveItem] = useState('Inicio');

  const items = ['Inicio', 'Perfil', 'Configuración'];

  const handleClick = (item) => {
    setActiveItem(item);
    onSelect(item);
  };

  return (
    <div className="sidebar">
      {items.map((item) => (
        <div
          key={item}
          className={`sidebar-item ${activeItem === item ? 'active' : ''}`}
          onClick={() => handleClick(item)}
        >
          {item}
        </div>
      ))}
    </div>
  );
};

export default Sidebar;
