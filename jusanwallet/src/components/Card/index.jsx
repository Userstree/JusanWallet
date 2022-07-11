import './card.css';

function Card() {
  return (
  <div className="card">
  <p className="title">CEO & Founder, Example</p>
  <p>Harvard University</p>
  <div style="margin: 24px 0;">
    <a href="#"><i className="fa fa-dribbble"></i></a> 
    <a href="#"><i className="fa fa-twitter"></i></a>  
    <a href="#"><i className="fa fa-linkedin"></i></a>  
    <a href="#"><i className="fa fa-facebook"></i></a> 
  </div>
  <p><button>Contact</button></p>
</div>
  );
}

export default Card;
