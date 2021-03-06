# Copyright (C) 2009 
# Sébastien Déjean, Institut de Mathematiques, Universite de Toulouse et CNRS (UMR 5219), France
# Ignacio González, Genopole Toulouse Midi-Pyrenees, France
# Kim-Anh Lê Cao, French National Institute for Agricultural Research and 
# Queensland Facility for Advanced Bioinformatics, University of Queensland, Australia
# Pierre Monget, Ecole d'Ingenieur du CESI, Angouleme, France
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.


splsda.model <-
function(X, Y,		
         ncomp = 2, 
         max.iter = 500,		 
         tol = 1e-06,
         keepX, keepY)
{
    X = as.matrix(X)	
    n = nrow(X)
	
    ind.mat = unmap(as.numeric(Y))
  
    result = spls.model(X, ind.mat, ncomp = ncomp, mode = "regression", keepX = keepX, 
                  max.iter = max.iter, tol = tol, keepY = keepY)
	 
    result$ind.mat = ind.mat
    result$names$Y = levels(Y)
    class(result) = "splsda"
    return(invisible(result))	
}

