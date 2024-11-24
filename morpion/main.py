game = [
    [1,2,3],
    [4,2,6],
    [1,2,3]
]

def state(player):
    return any([
        all(cell == player for cell in row) 
        for row in [
            (game[0][0],game[0][1],game[0][2]),
            (game[1][0],game[1][1],game[1][2]),
            (game[2][0],game[2][1],game[2][2]),

            (game[0][0],game[1][0],game[2][0]), 
            (game[0][1],game[1][1],game[2][1]),
            (game[0][2],game[1][2],game[2][2]),

            (game[0][0],game[1][1],game[2][2]),
            (game[0][2],game[1][1],game[2][0])
        ]
    ])

# Pour un tableau donné
#   if state("x"):
#       return True
#   elif state("O"):
#       return False
#   pour chaque case vide
#       

def turn(player):
    print_game()
    if state("X"):
        quit("Victoire du X")
        return 1
    elif state('O'):
        quit("Victoire du O")
        return 0
    else:
        for i in range(0,game.__len__(),1):
            for j in range(0, game[i].__len__(), 1):
                if game[i][j] != 'X' and game[i][j] != 'O':
                    game[i][j] = player
                    if player == 'X':
                        turn('O')
                    else:
                        turn('X')

def print_game():
    for row in game:
        print(row)
    print("---------------------------------")

turn("O")