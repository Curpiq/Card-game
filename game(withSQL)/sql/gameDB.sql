USE [master]
GO
/****** Object:  Database [gameDB]    Script Date: 08.12.2020 22:13:39 ******/
CREATE DATABASE [gameDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'gameDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER00\MSSQL\DATA\gameDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'gameDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER00\MSSQL\DATA\gameDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [gameDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gameDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [gameDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [gameDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [gameDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [gameDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [gameDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [gameDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [gameDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [gameDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [gameDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [gameDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [gameDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [gameDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [gameDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [gameDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [gameDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [gameDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [gameDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [gameDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [gameDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [gameDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [gameDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [gameDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [gameDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [gameDB] SET  MULTI_USER 
GO
ALTER DATABASE [gameDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [gameDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [gameDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [gameDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [gameDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [gameDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [gameDB] SET QUERY_STORE = OFF
GO
USE [gameDB]
GO
/****** Object:  Table [dbo].[audio]    Script Date: 08.12.2020 22:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[audio](
	[id_audio] [int] IDENTITY(1,1) NOT NULL,
	[id_game_level] [int] NULL,
	[author] [varchar](1) NULL,
	[name] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_audio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[card]    Script Date: 08.12.2020 22:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[card](
	[id_card] [int] IDENTITY(1,1) NOT NULL,
	[id_game_level] [int] NULL,
	[id_talent] [int] NULL,
	[id_image] [int] NULL,
	[point] [varchar](max) NULL,
	[type] [varchar](max) NULL,
	[usability] [varchar](max) NULL,
 CONSTRAINT [PK__card__C71FE367292A5E3F] PRIMARY KEY CLUSTERED 
(
	[id_card] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[enemy]    Script Date: 08.12.2020 22:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[enemy](
	[id_enemy] [int] IDENTITY(1,1) NOT NULL,
	[id_game_level] [int] NULL,
	[name] [varchar](max) NULL,
	[normal_damage] [int] NULL,
	[experience] [int] NULL,
 CONSTRAINT [PK__enemy__D08FD2E3BDAD6589] PRIMARY KEY CLUSTERED 
(
	[id_enemy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[enemy_skill]    Script Date: 08.12.2020 22:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[enemy_skill](
	[id_enemy_skill] [int] IDENTITY(1,1) NOT NULL,
	[id_enemy] [int] NULL,
	[name] [varchar](max) NULL,
	[description] [varchar](max) NULL,
 CONSTRAINT [PK__enemy_sk__CC8106DC45302830] PRIMARY KEY CLUSTERED 
(
	[id_enemy_skill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[game_level]    Script Date: 08.12.2020 22:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[game_level](
	[id_game_level] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_game_level] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[image]    Script Date: 08.12.2020 22:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image](
	[id_image] [int] IDENTITY(1,1) NOT NULL,
	[id_game_level] [int] NULL,
	[name] [varchar](max) NULL,
	[path] [varchar](max) NULL,
	[purpose] [varchar](max) NULL,
	[width] [int] NULL,
	[height] [int] NULL,
	[posX] [int] NULL,
	[posY] [int] NULL,
 CONSTRAINT [PK__image__C28C621CF0728F78] PRIMARY KEY CLUSTERED 
(
	[id_image] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[player]    Script Date: 08.12.2020 22:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[player](
	[id_player] [int] IDENTITY(1,1) NOT NULL,
	[id_game_level] [int] NULL,
	[username] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_player] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[player_state]    Script Date: 08.12.2020 22:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[player_state](
	[id_player_state] [int] IDENTITY(1,1) NOT NULL,
	[id_player] [int] NULL,
	[health_point] [int] NULL,
	[experience] [int] NULL,
	[player_level] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_player_state] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[talent]    Script Date: 08.12.2020 22:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[talent](
	[id_talent] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](max) NULL,
	[description] [varchar](max) NULL,
	[required_level] [int] NULL,
	[activity] [varchar](max) NULL,
	[posX] [int] NULL,
	[posY] [int] NULL,
 CONSTRAINT [PK__talent__035ED3E04890F337] PRIMARY KEY CLUSTERED 
(
	[id_talent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[card] ON 

INSERT [dbo].[card] ([id_card], [id_game_level], [id_talent], [id_image], [point], [type], [usability]) VALUES (1, 1, 1, 1, N'5', N'atk', N'used')
INSERT [dbo].[card] ([id_card], [id_game_level], [id_talent], [id_image], [point], [type], [usability]) VALUES (2, 1, 1, 2, N'10', N'atk', N'used')
INSERT [dbo].[card] ([id_card], [id_game_level], [id_talent], [id_image], [point], [type], [usability]) VALUES (3, 1, 1, 3, N'15', N'atk', N'used')
INSERT [dbo].[card] ([id_card], [id_game_level], [id_talent], [id_image], [point], [type], [usability]) VALUES (4, 1, 1, 4, N'20', N'atk', N'used')
INSERT [dbo].[card] ([id_card], [id_game_level], [id_talent], [id_image], [point], [type], [usability]) VALUES (5, 1, 2, 5, N'5', N'blood', N'used')
INSERT [dbo].[card] ([id_card], [id_game_level], [id_talent], [id_image], [point], [type], [usability]) VALUES (6, 1, 2, 6, N'10', N'blood', N'used')
INSERT [dbo].[card] ([id_card], [id_game_level], [id_talent], [id_image], [point], [type], [usability]) VALUES (7, 1, 2, 7, N'15', N'blood', N'used')
INSERT [dbo].[card] ([id_card], [id_game_level], [id_talent], [id_image], [point], [type], [usability]) VALUES (8, 1, 2, 8, N'20', N'blood', N'used')
INSERT [dbo].[card] ([id_card], [id_game_level], [id_talent], [id_image], [point], [type], [usability]) VALUES (9, 1, 3, 9, N'5', N'fire', N'not used')
INSERT [dbo].[card] ([id_card], [id_game_level], [id_talent], [id_image], [point], [type], [usability]) VALUES (10, 1, 3, 10, N'10', N'fire', N'not used')
INSERT [dbo].[card] ([id_card], [id_game_level], [id_talent], [id_image], [point], [type], [usability]) VALUES (11, 1, 3, 11, N'15', N'fire', N'not used')
INSERT [dbo].[card] ([id_card], [id_game_level], [id_talent], [id_image], [point], [type], [usability]) VALUES (12, 1, 3, 12, N'20', N'fire', N'not used')
INSERT [dbo].[card] ([id_card], [id_game_level], [id_talent], [id_image], [point], [type], [usability]) VALUES (13, 1, 4, 13, N'5', N'shield', N'not used')
INSERT [dbo].[card] ([id_card], [id_game_level], [id_talent], [id_image], [point], [type], [usability]) VALUES (14, 1, 4, 14, N'10', N'shield', N'not used')
INSERT [dbo].[card] ([id_card], [id_game_level], [id_talent], [id_image], [point], [type], [usability]) VALUES (15, 1, 4, 15, N'15', N'shield', N'not used')
INSERT [dbo].[card] ([id_card], [id_game_level], [id_talent], [id_image], [point], [type], [usability]) VALUES (16, 1, 4, 16, N'20', N'shield', N'not used')
INSERT [dbo].[card] ([id_card], [id_game_level], [id_talent], [id_image], [point], [type], [usability]) VALUES (17, 1, 6, 18, N'5', N'heal', N'not used')
INSERT [dbo].[card] ([id_card], [id_game_level], [id_talent], [id_image], [point], [type], [usability]) VALUES (18, 1, 6, 19, N'10', N'heal', N'not used')
INSERT [dbo].[card] ([id_card], [id_game_level], [id_talent], [id_image], [point], [type], [usability]) VALUES (19, 1, 6, 20, N'15', N'heal', N'not used')
INSERT [dbo].[card] ([id_card], [id_game_level], [id_talent], [id_image], [point], [type], [usability]) VALUES (20, 1, 6, 21, N'20', N'heal', N'not used')
SET IDENTITY_INSERT [dbo].[card] OFF
GO
SET IDENTITY_INSERT [dbo].[enemy] ON 

INSERT [dbo].[enemy] ([id_enemy], [id_game_level], [name], [normal_damage], [experience]) VALUES (1, 1, N'Slime', 5, 5)
INSERT [dbo].[enemy] ([id_enemy], [id_game_level], [name], [normal_damage], [experience]) VALUES (2, 1, N'Dog', 10, 12)
SET IDENTITY_INSERT [dbo].[enemy] OFF
GO
SET IDENTITY_INSERT [dbo].[game_level] ON 

INSERT [dbo].[game_level] ([id_game_level]) VALUES (1)
SET IDENTITY_INSERT [dbo].[game_level] OFF
GO
SET IDENTITY_INSERT [dbo].[image] ON 

INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (1, 1, N'Card Atk 5', N'image/card/5(1).png', N'card', 100, 150, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (2, 1, N'Card Atk 10', N'image/card/10(1).png', N'card', 100, 150, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (3, 1, N'Card Atk 15', N'image/card/15(1).png', N'card', 100, 150, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (4, 1, N'Card Atk 20', N'image/card/20(1).png', N'card', 100, 150, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (5, 1, N'Card Blood 5', N'image/card/5(2).png', N'card', 100, 150, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (6, 1, N'Card Blood 10', N'image/card/10(2).png', N'card', 100, 150, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (7, 1, N'Card Blood 15', N'image/card/15(2).png', N'card', 100, 150, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (8, 1, N'Card Blood 20', N'image/card/20(2).png', N'card', 100, 150, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (9, 1, N'Card Fire 5', N'image/card/5(3).png', N'card', 100, 150, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (10, 1, N'Card Fire 10', N'image/card/10(3).png', N'card', 100, 150, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (11, 1, N'Card Fire 15', N'image/card/15(3).png', N'card', 100, 150, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (12, 1, N'Card Fire 20', N'image/card/20(3).png', N'card', 100, 150, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (13, 1, N'Card Shield 5', N'image/card/5(4).png', N'card', 100, 150, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (14, 1, N'Card Shield 10', N'image/card/10(4).png', N'card', 100, 150, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (15, 1, N'Card Shield 15', N'image/card/15(4).png', N'card', 100, 150, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (16, 1, N'Card Shield 20', N'image/card/20(4).png', N'card', 100, 150, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (17, 1, N'Card Clever Trick', N'image/card/5(5).png', N'card', 100, 150, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (18, 1, N'Card Heal 5', N'image/card/5(6).png', N'card', 100, 150, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (19, 1, N'Card Heal 10', N'image/card/10(6).png', N'card', 100, 150, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (20, 1, N'Card Heal 15', N'image/card/15(6).png', N'card', 100, 150, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (21, 1, N'Card Heal 20', N'image/card/20(6).png', N'card', 100, 150, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (22, 1, N'No card', N'image/card/noCard.png', N'card', 100, 150, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (23, 1, N'Background 1 lvl', N'image/background/1.png', N'background', 1000, 600, 0, 0)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (24, 1, N'Hero window', N'image/details/hero.png', N'detail', 190, 300, 40, 280)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (25, 1, N'Step line', N'image/details/line.png', N'detail', 600, 30, 200, 30)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (26, 1, N'Mob window', N'image/details/mob.png', N'detail', 190, 300, 770, 280)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (27, 1, N'Talent tree button', N'image/details/state.png', N'detail', 140, 50, 30, 20)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (28, 1, N'Blood effect', N'image/effect/mobblood.png', N'effect', 190, 300, 770, 280)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (29, 1, N'Fire effect', N'image/effect/mobfire.png', N'effect', 190, 300, 770, 280)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (30, 1, N'Alice', N'image/mob/Alice.png', N'mob', 190, 300, 770, 280)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (31, 1, N'Alice', N'image/mob/Alice1.png', N'mob', 380, 700, 400, 60)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (32, 1, N'Alice(angry)', N'image/mob/Alice2.png', N'mob', 380, 700, 400, 40)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (33, 1, N'Slime', N'image/mob/slime.png', N'mob', 190, 300, 770, 280)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (34, 1, N'Talent choice', N'image/talent/choice.png', N'talent', 400, 500, 300, 50)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (35, 1, N'Talent tree', N'image/talent/tree.png', N'talent', 400, 500, 300, 50)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (36, 1, N'Talent active cell', N'image/talent/treeActive.png', N'talent', 90, 85, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (37, 1, N'Chest', N'image/mob/chest(1).png', N'mob', 250, 200, 370, 220)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (38, 1, N'Chest(open)', N'image/mob/chest(2).png', N'mob', 450, 350, 270, 85)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (39, 1, N'Dog', N'image/mob/dog(1).png', N'mob', 190, 300, 770, 280)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (40, 1, N'Dog', N'image/mob/dog(2).png', N'mob', 400, 330, 300, 100)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (41, 1, N'Bite effect', N'image/effect/playerbite.png', N'effect', 190, 300, 40, 280)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (42, 1, N'Alice(laughs)', N'image/mob/Alice3.png', N'mob', 300, 700, 400, 60)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (43, 1, N'Card Vamp 5', N'image/card/5(7).png', N'card', 100, 150, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (44, 1, N'Card Vamp 10', N'image/card/10(7).png', N'card', 100, 150, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (45, 1, N'Card Vamp 15', N'image/card/15(7).png', N'card', 100, 150, NULL, NULL)
INSERT [dbo].[image] ([id_image], [id_game_level], [name], [path], [purpose], [width], [height], [posX], [posY]) VALUES (46, 1, N'Card Vamp 20', N'image/card/20(7).png', N'card', 100, 150, NULL, NULL)
SET IDENTITY_INSERT [dbo].[image] OFF
GO
SET IDENTITY_INSERT [dbo].[talent] ON 

INSERT [dbo].[talent] ([id_talent], [name], [description], [required_level], [activity], [posX], [posY]) VALUES (1, N'Обычный удар', N'Обычный удар наносящий столько урона, сколько указано на карте', 1, N'active', 450, 205)
INSERT [dbo].[talent] ([id_talent], [name], [description], [required_level], [activity], [posX], [posY]) VALUES (2, N'Кровотечение', N'Обычный удар с дополнительным эффектом кровотечения: эффект отнимает у противника по 2/3/4/5 единиц здоровья в течение 5 ходов(в зависимости от цифры на карточке). Эффект не стакается', 2, N'active', 380, 270)
INSERT [dbo].[talent] ([id_talent], [name], [description], [required_level], [activity], [posX], [posY]) VALUES (3, N'Поджог', N'Обычный удар с дополнительным эффектом поджога: эффект отнимает у противника по 2/3/4/5 единиц здоровья в течение 5 ходов(в зависимости от цифры на карточке). Эффект не стакается', 2, N'inactive', 524, 273)
INSERT [dbo].[talent] ([id_talent], [name], [description], [required_level], [activity], [posX], [posY]) VALUES (4, N'Блок', N'Накладывает на героя щит на 1 ход, блокирующий 50/60/70/80% урона', 3, N'inactive', 335, 353)
INSERT [dbo].[talent] ([id_talent], [name], [description], [required_level], [activity], [posX], [posY]) VALUES (5, N'Ловкий трюк', N'Позволяет после использования 3 карт обновить их, оставив одну на руках', 3, N'inactive', 450, 353)
INSERT [dbo].[talent] ([id_talent], [name], [description], [required_level], [activity], [posX], [posY]) VALUES (6, N'Исцеление', N'Мгновенно исцеляет 20/30/40/50 единиц здоровья герою', 3, N'inactive', 575, 354)
INSERT [dbo].[talent] ([id_talent], [name], [description], [required_level], [activity], [posX], [posY]) VALUES (7, N'Вампиризм', N'В течение 3 ходов, когда герой атакует, он восполняет', 4, N'inactive', 333, 452)
INSERT [dbo].[talent] ([id_talent], [name], [description], [required_level], [activity], [posX], [posY]) VALUES (8, N'Отразить удар', N'Накладывает на героя щит на 1 ход, блокирующий 50/60/70/80% урона и наносящий противнику 50% заблокированного урона', 4, N'inactive', 450, 450)
INSERT [dbo].[talent] ([id_talent], [name], [description], [required_level], [activity], [posX], [posY]) VALUES (9, N'Заморозка', N'Ударяет противника и замораживает его на 1 ход, из-за чего он пропускает свой следующий ход', 4, N'inactive', 574, 453)
SET IDENTITY_INSERT [dbo].[talent] OFF
GO
ALTER TABLE [dbo].[audio]  WITH CHECK ADD FOREIGN KEY([id_game_level])
REFERENCES [dbo].[game_level] ([id_game_level])
GO
ALTER TABLE [dbo].[card]  WITH CHECK ADD  CONSTRAINT [FK__card__id_game_le__35BCFE0A] FOREIGN KEY([id_game_level])
REFERENCES [dbo].[game_level] ([id_game_level])
GO
ALTER TABLE [dbo].[card] CHECK CONSTRAINT [FK__card__id_game_le__35BCFE0A]
GO
ALTER TABLE [dbo].[card]  WITH CHECK ADD  CONSTRAINT [FK__card__id_image__37A5467C] FOREIGN KEY([id_image])
REFERENCES [dbo].[image] ([id_image])
GO
ALTER TABLE [dbo].[card] CHECK CONSTRAINT [FK__card__id_image__37A5467C]
GO
ALTER TABLE [dbo].[card]  WITH CHECK ADD  CONSTRAINT [FK__card__id_talent__36B12243] FOREIGN KEY([id_talent])
REFERENCES [dbo].[talent] ([id_talent])
GO
ALTER TABLE [dbo].[card] CHECK CONSTRAINT [FK__card__id_talent__36B12243]
GO
ALTER TABLE [dbo].[enemy]  WITH CHECK ADD  CONSTRAINT [FK__enemy__id_game_l__3A81B327] FOREIGN KEY([id_game_level])
REFERENCES [dbo].[game_level] ([id_game_level])
GO
ALTER TABLE [dbo].[enemy] CHECK CONSTRAINT [FK__enemy__id_game_l__3A81B327]
GO
ALTER TABLE [dbo].[enemy_skill]  WITH CHECK ADD  CONSTRAINT [FK__enemy_ski__id_en__3C69FB99] FOREIGN KEY([id_enemy])
REFERENCES [dbo].[enemy] ([id_enemy])
GO
ALTER TABLE [dbo].[enemy_skill] CHECK CONSTRAINT [FK__enemy_ski__id_en__3C69FB99]
GO
ALTER TABLE [dbo].[image]  WITH CHECK ADD  CONSTRAINT [FK__image__id_game_l__38996AB5] FOREIGN KEY([id_game_level])
REFERENCES [dbo].[game_level] ([id_game_level])
GO
ALTER TABLE [dbo].[image] CHECK CONSTRAINT [FK__image__id_game_l__38996AB5]
GO
ALTER TABLE [dbo].[player]  WITH CHECK ADD FOREIGN KEY([id_game_level])
REFERENCES [dbo].[game_level] ([id_game_level])
GO
ALTER TABLE [dbo].[player_state]  WITH CHECK ADD FOREIGN KEY([id_player])
REFERENCES [dbo].[player] ([id_player])
GO
USE [master]
GO
ALTER DATABASE [gameDB] SET  READ_WRITE 
GO
