import React from 'react';

function StyledButton() {
    const handleClick = () => {
        console.log("Botón presionado");
    };

    const buttonStyle = {
        backgroundColor: '#007BFF',
        color: 'white',
        fontWeight: 'bold',
        padding: '8px 16px',
        borderRadius: '8px',
        border: 'none',
        cursor: 'pointer',
        textAlign: 'center'
    };

    const hoverStyle = {
        backgroundColor: '#0056b3'
    };

    return (
        <button
            style={buttonStyle}
            onClick={handleClick}
            onMouseOver={e => e.currentTarget.style.backgroundColor = hoverStyle.backgroundColor}
            onMouseOut={e => e.currentTarget.style.backgroundColor = buttonStyle.backgroundColor}
        >
            Presionar
        </button>
    );
}

export default StyledButton;
