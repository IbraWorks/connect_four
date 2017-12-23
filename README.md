Pre thoughts
---------------------
This is my first TDD project, and I'm not comfortable with rspec just yet.
I understand its use with basic methods, but handling input sounds like it's
going to be a pain. As for the game itself, I've played connect four a lot,
and I'm comfortable with OOP so the game shouldn't be too hard.

Things I'm concerned about:
1) The constructs of connect four. How pieces pile up in a column. constructing
a viable move_list

2) I've never TDD a project before. So I'm worried about the structure.
My usual work process is: think -> code -> test -> refactor
It's going to be difficult to: think -> test -> code -> refactor

Things I'm confident in:
1) Rspec for simple methods that are straightforward.

Post thoughts
---------------------
This project was really interesting. I know that TDD is the way to go as you
build a strong foundation and bugs are less likely to occur, particularly if
you test intensely. But having said that, TDD is so annoying for me at this point.
I naturally just want to get stuck in and resisting the temptation is difficult
for me. I will try to get better at that in the future.

Also, I found that my coding style is a bad one. I kind of code on the fly
sometimes, changing my mind about something some time into coding. This is bad
practice, especially with TDD. Because if I change the structure of the project
I'd have to change the structure of the tests. The fact that coding on the fly
like this is bad practice anyway, I like TDD in that it forced me to get rid of
bad habbits.

The real issue with TDD is user input. Testing for user input is a pain,
and I found that although the tests passed, mocking them was not easy when it
came to input. The comments in connect_four.rb and game_spec.rb illustrate this.

All in all I'm really proud of this project, mainly because I like playing
connect four, but also because TDD has forced me to get rid of a bad habit.

Things to improve on:
1) Spending hours thinking and writing a useful plan is worth it.
2) Learn how to handle input smoothly with rspec.
