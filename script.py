import psycopg2, os, xmltodict, csv

host = input("Server [localhost]: ") or "localhost"
database = input("Database [postgres]: ") or "postgres"
port = input("Port [5432]: ") or "5432"
user = input("Username [postgres]: ") or "postgres"
password = input("Contraseña para el usuario " + user + ": ")

conn = psycopg2.connect(database=database,
                        user=user, password=password, 
                        host=host, port=port)

carpeta_actual = os.getcwd()

conn.autocommit = True
cursor = conn.cursor()

#Insertar datos de Country.csv
insert_country = "COPY country(id, name) FROM '{}\Country.csv' DELIMITER ',' CSV HEADER;".format(carpeta_actual)
cursor.execute(insert_country)

#Insertar datos de League.csv
insert_league = "COPY league(id, country_id, name) FROM '{}\League.csv' DELIMITER ',' CSV HEADER;".format(carpeta_actual)
cursor.execute(insert_league)

#Insertar datos de Player.csv
insert_player = "COPY player(id,player_api_id,player_name,player_fifa_api_id,birthday,height,weight) FROM '{}\Player.csv' DELIMITER ',' CSV HEADER;".format(carpeta_actual)
cursor.execute(insert_player)

#Insertar datos de Player_Attributes.csv
insert_player_attributes = '''COPY player_attributes(id,player_fifa_api_id,player_api_id,date,overall_rating,
potential,preferred_foot,attacking_work_rate,defensive_work_rate,crossing,finishing,heading_accuracy,
short_passing,volleys,dribbling,curve,free_kick_accuracy,long_passing,ball_control,acceleration,
sprint_speed,agility,reactions,balance,shot_power,jumping,stamina,strength,long_shots,aggression,
interceptions,positioning,vision,penalties,marking,standing_tackle,sliding_tackle,gk_diving,
gk_handling,gk_kicking,gk_positioning,gk_reflexes) FROM '{}\Player_Attributes.csv' DELIMITER ',' CSV HEADER'''.format(carpeta_actual)
cursor.execute(insert_player_attributes)

#Insertar datos de Team.csv
insert_team = '''COPY team(id,team_api_id,team_fifa_api_id,team_long_name,team_short_name) FROM '{}\Team.csv' DELIMITER ',' CSV HEADER'''.format(carpeta_actual)
cursor.execute(insert_team)

#Insertar datos de Team_Attributes.csv
insert_team_attributes = '''COPY team_attributes(id,team_fifa_api_id,team_api_id,date,buildUpPlaySpeed,buildUpPlaySpeedClass,
buildUpPlayDribbling,buildUpPlayDribblingClass,buildUpPlayPassing,buildUpPlayPassingClass,buildUpPlayPositioningClass,
chanceCreationPassing,chanceCreationPassingClass,chanceCreationCrossing,chanceCreationCrossingClass,chanceCreationShooting,
chanceCreationShootingClass,chanceCreationPositioningClass,defencePressure,defencePressureClass,defenceAggression,
defenceAggressionClass,defenceTeamWidth,defenceTeamWidthClass,defenceDefenderLineClass) FROM '{}\Team_Attributes.csv' DELIMITER ',' CSV HEADER'''.format(carpeta_actual)
cursor.execute(insert_team_attributes)

#Insertar datos de Match.csv
insert_match = '''COPY match(id,country_id,league_id,season,stage,date,match_api_id,home_team_api_id,away_team_api_id,
home_team_goal,away_team_goal,home_player_X1,home_player_X2,home_player_X3,home_player_X4,home_player_X5,home_player_X6,
home_player_X7,home_player_X8,home_player_X9,home_player_X10,home_player_X11,away_player_X1,away_player_X2,away_player_X3,
away_player_X4,away_player_X5,away_player_X6,away_player_X7,away_player_X8,away_player_X9,away_player_X10,away_player_X11,
home_player_Y1,home_player_Y2,home_player_Y3,home_player_Y4,home_player_Y5,home_player_Y6,home_player_Y7,home_player_Y8,
home_player_Y9,home_player_Y10,home_player_Y11,away_player_Y1,away_player_Y2,away_player_Y3,away_player_Y4,away_player_Y5,
away_player_Y6,away_player_Y7,away_player_Y8,away_player_Y9,away_player_Y10,away_player_Y11,home_player_1,home_player_2,
home_player_3,home_player_4,home_player_5,home_player_6,home_player_7,home_player_8,home_player_9,home_player_10,
home_player_11,away_player_1,away_player_2,away_player_3,away_player_4,away_player_5,away_player_6,away_player_7,
away_player_8,away_player_9,away_player_10,away_player_11,goal,shoton,shotoff,foul_commit,card,cross_text,corner,
possession,B365H,B365D,B365A,BWH,BWD,BWA,IWH,IWD,IWA,LBH,LBD,LBA,PSH,PSD,PSA,WHH,WHD,WHA,SJH,SJD,SJA,VCH,VCD,VCA,
GBH,GBD,GBA,BSH,BSD,BSA) FROM '{}\Match.csv' DELIMITER ',' CSV HEADER'''.format(carpeta_actual)
cursor.execute(insert_match)

#Insertar datos del XML Foul_Commit en Match.csv
fouls = []
with open ('Match.csv', 'r') as file:
    reader = csv.reader(file)
    next(reader)
    for row in reader:
        fouls.append({'match_api_id': row[6], 'foul_commit': row[80]})

fouls_xml = []
for foul in fouls:
    if not foul['foul_commit'] == '':
        fouls_xml.append({'match_api_id': foul['match_api_id'], 'foul': xmltodict.parse(foul['foul_commit'])})
    else:
        fouls_xml.append({'match_api_id': foul['match_api_id'], 'foul': ''})



#Diccionario de faltas
fouls_dict = []
for foul_xml in fouls_xml:
    if not foul_xml['foul'] == '':
        if not foul_xml['foul']['foulcommit'] == None:
            if not foul_xml['foul']['foulcommit']['value'] == None:
                if type(foul_xml['foul']['foulcommit']['value']) is list: #Comprobar si hay más de una falta en el partido
                    for value in foul_xml['foul']['foulcommit']['value']:
                        if not (value['id'] == None) or not (value['id'] in value.keys()):
                            foul = {'foul_id': value['id'], 'match_api_id': foul_xml['match_api_id'],
                                    'player_responsable_id': value['player1'] if 'player1' in value.keys() else 'Null',
                                    'player_victim_id': value['player2'] if 'player2' in value.keys() else 'Null',
                                    'team_responsable': value['team'] if 'team' in value.keys() else 'Null'}
                            fouls_dict.append(foul)
                else:
                    if not foul_xml['foul']['foulcommit']['value'] == None:
                        foul = {'foul_id': foul_xml['foul']['foulcommit']['value']['id'], 'match_api_id': foul_xml['match_api_id'],
                                'player_responsable_id': foul_xml['foul']['foulcommit']['value']['player1'] if 'player1' in foul_xml['foul']['foulcommit']['value'].keys() else 'Null',
                                'player_victim_id': foul_xml['foul']['foulcommit']['value']['player2'] if 'player2' in foul_xml['foul']['foulcommit']['value'].keys() else 'Null',
                                'team_responsable': foul_xml['foul']['foulcommit']['value']['team'] if 'team' in foul_xml['foul']['foulcommit']['value'].keys() else 'Null'}
                        fouls_dict.append(foul)

for foul in fouls_dict:
    if not foul['foul_id'] == '878509':
        insert_foul = '''INSERT INTO "foul" VALUES (%s, %s, %s, %s, %s);''' %(foul['foul_id'],foul['match_api_id'], foul['player_responsable_id'], foul['player_victim_id'], foul['team_responsable'])
        cursor.execute(insert_foul)
        
print('Transferencia de datos finalizada')