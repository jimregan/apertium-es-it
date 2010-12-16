#!/usr/bin/gawk -f

function transforma_contenido(cad,      PARTES)
{
  split(cad, PARTES, "</i>");
  return PARTES[1] "</l><r>" PARTES[1] "</r></p>" PARTES[2]; 
}

{

  if(index($0, "<e") && index($0, "</e>") && index($0, "<i>"))
  {
    nf = split($0, PARTES, "<i>");
    res = PARTES[1];
    for(i = 2; i <= nf; i++)
    {
      res = res "<p><l>" transforma_contenido(PARTES[i]);
    }
 
    print res;
  }
  else
  {
    print;
  }
}