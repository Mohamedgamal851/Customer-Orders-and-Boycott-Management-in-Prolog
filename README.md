# Customer-Orders-and-Boycott-Management-in-Prolog
In this assignment, you will develop a Prolog program to manage customer orders and handle boycott information based on a provided data file, "data.pl". You will write Prolog predicates to perform various tasks


## Problem Statement
Given the data.pl file, you are required to write a prolog problem that answers some questions
about the customers and their orders. Also, you shall help the customers to know boycott items
and their alternatives.
## Facts (data.pl file):
You must use this data file in your assignment. You are given some facts about customers,
items, orders, boycott companies and their alternatives. For Example:
customer(CustID, CustUserName).
→ customer(104, mazen122)<br>
item(ItemName, companyName, Price).
→ item(pepsi, “PepsiCo”, 8.5).<br>
order(CustID,OrderID,[Items]).
→ order(1,1,[ariel_4k, biskrem, cheese]).<br>
boycott_company(companyName, justification).
→boycott_company(“PepsiCo”, “PepsiCo purchased the ...”)<br>
alternative(ItemName,AlternativeItem).
→alternative(chipsy, tiger).

## Required Predicates:

1.  List all orders of a specific customer (as a list).
Example:
?- list_orders(shahd_ghazal2002,L).
L = [order(101, 2, [loreal_hair_serum_100ml, sunsilk_shampoo_350ml]), order(101, 1,
[puvana, orange_1k, feba_dishwash_1L, snickers, ahlawy])].

2.  Get the number of orders of a specific customer given customer id.
Example:
?- countOrdersOfCustomer(shahd_ghazal2002,Count).
Count = 2.

3.  List all items in a specific customer order given customer id and
order id.
Example:
?- getItemsInOrderById(shahd_ghazal2002,1,Items).
Items = [puvana, orange_1k, feba_dishwash_1L, snickers, ahlawy] .

4.  Get the num of items in a specific customer order given customer
Name and order id.
Example:
?- getNumOfItems(shahd_ghazal2002,2,Count).
Count = 2.

5.  Calculate the price of a given order given Customer Name and order id
Example:
?- calcPriceOfOrder(shahd_ghazal2002,2,TotalPrice).
TotalPrice = 319.

6.  Given the item name or company name, determine whether we need
to boycott or not.
Examples:
?- isBoycott(sunbites).
true.
?- isBoycott(biskrem).
false.

7.  Given the company name or an item name, find the justification why
you need to boycott this company/item.
Examples:
?- whyToBoycott(dasani, Justification).
Justification = 'Coca-Cola israel: owns farms in the illegal israeli settlements of Shadmot
Mechola in the Jordan Valley and a plant in the industrial zone of Katzerin in the occupied
Golan Heights'.

8.  Given an username and order ID, remove all the boycott items from
this order.
Examples:
?- removeBoycottItemsFromAnOrder(abu_juliaa, 1, NewList).
NewList = [flour_1k] .

9.  Given an username and order ID, update the order such that all
boycott items are replaced by an alternative (if exists).
Examples:
?- replaceBoycottItemsFromAnOrder(abu_juliaa, 1, NewList).
NewList = [juhayna_yogurt, corona_chocolate, puvana, flour_1k] .

10.  Given an username and order ID, calculate the price of the order after
replacing all boycott items by its alternative (if it exists).
Examples:
?- calcPriceAfterReplacingBoycottItemsFromAnOrder(abu_juliaa, 1, NewList, TotalPrice).
NewList = [juhayna_yogurt, corona_chocolate, puvana, flour_1k],
TotalPrice = 56 .

11.  calculate the difference in price between the boycott item and its
alternative.
Examples:
?- getTheDifferenceInPriceBetweenItemAndAlternative(lipton, A, DiffPrice).
A = elarosa_tea,
DiffPrice = -11.25.

12.  BONUS: Insert/Remove (1)item, (2)alternative and (3)new boycott
company to/from the knowledge base. Hint: use assert to insert new fact and
retract to remove a fact
Examples:
?- add_item(alpella_wafer, 'Alpella', 4).
true.
?- item(alpella_wafer, 'Alpella', 4).
true.
?- remove_item(alpella_wafer, 'Alpella', 4).
true.
?- item(alpella_wafer, 'Alpella', 4).
false.

## References
https://github.com/TechForPalestine/boycott-israeli-consumer-goods-dataset
https://play.google.com/store/apps/details?id=com.moqate3.moqate3&hl=en_SG&gl=US
https://www.tutorialspoint.com/prolog/index.htm
