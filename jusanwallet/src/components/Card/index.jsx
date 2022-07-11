import './card.css';

// import {SiContactlesspayment} from 'react-icons/si';
import {ReactComponent as Logo} from './jusan-logo.svg';
import {ReactComponent as Jmart} from './jmart2.svg';

export function Card() {
  return (
    <div className='Card'><br />
    <div className="row">
      <div className="column">
        <div className="card">
        <Logo />
          <p>12000 KZT</p>
        </div>
      </div>
    
      <div className="column">
        <div className="card">
          <Logo />
          <p>Junior</p>
        </div>
      </div>
      
      <div className="column">
        <div className="card">
          <Jmart />
          <p>12000 kzt</p>
        </div>
      </div>
      <div className="column">
        <div className="card">
        {/* <img src='./logo.png' alt='jusan' width={'200px'} /> */}
          <p>Some text</p>
        </div>
      </div>
    </div>
    </div>
    
  );
}

// export default Card;
