import React, { useState } from 'react';
import Sidebar from './components/Sidebar';

function App() {
  const [selected, setSelected] = useState('Inicio');

  return (
    <div style={{ display: 'flex' }}>
      <Sidebar onSelect={setSelected} />
      <div style={{ marginLeft: '220px', padding: '20px' }}>
        <h1>{selected}</h1>
        <p>Estás en la sección: {selected}</p>
      </div>
    </div>
  );
}

export default App;
