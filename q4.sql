select count (*) as NUMBER#
from 
(select peid from person 
minus (select peid from contract) 
minus (select peid from deal) 
minus (select peid from property)
);
