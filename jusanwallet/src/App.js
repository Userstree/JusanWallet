import './App.css';
import { Main } from './components/Main';
import { Home } from './components/Home';
import { Autopayment } from './components/Autopayment';
import { Menu } from './components/Menu';
import { Statistics } from './components/Statistics';

import { render } from 'react-dom';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import App from './App';

const rootElement = document.getElementById('root');
render(
  <BrowserRouter>
    <Routes>
      <Route path='/' element={<Main />} />
      <Route path='autopayment' element={<Autopayment />} />
      <Route path='statistics' element={<Statistics />} />
    </Routes>
  </BrowserRouter>,
  rootElement
);

// function App() {
//   return (
//     <div className='App'>
//       <Main />
//       <header className='App-header'></header>
//     </div>
//   );
// }

export default App;
