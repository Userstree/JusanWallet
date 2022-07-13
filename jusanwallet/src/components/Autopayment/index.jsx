import '../../App.css';
import { Menu } from '../Menu';
import Box from '@mui/material/Box';
import Grid from '@mui/material/Grid';
import { experimentalStyled as styled } from '@mui/material/styles';
import Paper from '@mui/material/Paper';
import { Button } from '@mui/material';

const Item = styled(Paper)(({ theme }) => ({
  backgroundColor: theme.palette.mode === 'dark' ? '#1A2027' : '#fd6900',
  ...theme.typography.body2,
  padding: theme.spacing(2),
  textAlign: 'center',
  color: '#fafafa',
}));

export function Autopayment() {
  return (
    <div className='Autopayment'>
      <Menu />
      <div className= "title">
       <span>Autopayment</span>
        <hr color = "orange" />
      </div>
      <div className='content'>
       
        <Button variant="contained" id = 'btn' onclick={fun}> + </Button>
        <div id="myModal" className="modal">

  <div className = "modal-content">
    <span className = "close" id='close'>&times;</span>
    <p>Some text in the Modal..</p>
  </div>

</div>
        
        <Box sx={{ flexGrow: 2 }}>
          <Grid 
            container
            spacing={{ xs: 2, md: 3 }}
            columns={{ xs: 2, sm: 5, md: 10 }}
          >
            <Grid item xs={2} sm={4} md={4}>
              <Button> date </Button> <Button> period </Button>
              <Item>Tele-2</Item>
            </Grid>
            <Grid item xs={2} sm={4} md={4}>
              <Button> date </Button> <Button> period </Button>
              <Item>KinderGarden</Item>
            </Grid>
            <Grid item xs={2} sm={4} md={4}>
              <Button> date </Button> <Button> period </Button>
              <Item>Credit</Item>
            </Grid>
            <Grid item xs={2} sm={4} md={4}>
              <Button> date </Button> <Button> period </Button>
              <Item>Kommunalnye uslugi</Item>
            </Grid>
          </Grid>
        </Box>
      </div>
    </div>
  );
}

// Get the modal

const modal = document.getElementById("myModal");

// Get the button that opens the modal
const btn = document.getElementById('btn');

// Get the <span> element that closes the modal
const span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
function fun() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
// span.onclick = function() {
//   modal.style.display = "none";
// }

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target === modal) {
    modal.style.display = "none";
  }
}

