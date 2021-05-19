/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function nobackbutton()
{
    /*history.pushState(null, document.title, location.href);
    window.addEventListener('popstate', function (event)
    {
        history.pushState(null, document.title, location.href);
    });*/
    
    if(history.forward(1))
      location.replace(history.forward(1));
}
