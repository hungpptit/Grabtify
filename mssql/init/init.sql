USE [master];
GO

CREATE DATABASE [DB_Graptify]
  CONTAINMENT = NONE
  ON PRIMARY
  ( NAME = N'DB_Graptify',
    FILENAME = N'/var/opt/mssql/data/DB_Graptify.mdf',
    SIZE = 73728KB,
    MAXSIZE = UNLIMITED,
    FILEGROWTH = 65536KB )
  LOG ON
  ( NAME = N'DB_Graptify_log',
    FILENAME = N'/var/opt/mssql/data/DB_Graptify_log.ldf',
    SIZE = 73728KB,
    MAXSIZE = 2048GB,
    FILEGROWTH = 65536KB );

WAITFOR DELAY '00:00:05';
GO
ALTER DATABASE [DB_Graptify] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_Graptify].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_Graptify] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_Graptify] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_Graptify] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_Graptify] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_Graptify] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_Graptify] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_Graptify] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_Graptify] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_Graptify] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_Graptify] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_Graptify] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_Graptify] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_Graptify] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_Graptify] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_Graptify] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_Graptify] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_Graptify] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_Graptify] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_Graptify] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_Graptify] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_Graptify] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_Graptify] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_Graptify] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_Graptify] SET  MULTI_USER 
GO
ALTER DATABASE [DB_Graptify] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_Graptify] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_Graptify] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_Graptify] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_Graptify] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_Graptify] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_Graptify', N'ON'
GO
ALTER DATABASE [DB_Graptify] SET QUERY_STORE = ON
GO
ALTER DATABASE [DB_Graptify] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DB_Graptify]
GO
/****** Object:  Table [dbo].[Likes]    Script Date: 5/28/2025 1:45:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Likes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[trackId] [int] NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[listeningHistories]    Script Date: 5/28/2025 1:45:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[listeningHistories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[trackId] [int] NULL,
	[listenCount] [int] NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Metadata]    Script Date: 5/28/2025 1:45:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Metadata](
	[trackname] [nvarchar](255) NULL,
	[track_id] [int] NOT NULL,
	[explicit] [float] NULL,
	[danceability] [float] NULL,
	[energy] [float] NULL,
	[key] [int] NULL,
	[loudness] [float] NULL,
	[mode] [int] NULL,
	[speechiness] [float] NULL,
	[acousticness] [float] NULL,
	[instrumentalness] [float] NULL,
	[liveness] [float] NULL,
	[valence] [float] NULL,
	[tempo] [float] NULL,
	[duration_ms] [int] NULL,
	[time_signature] [int] NULL,
	[year] [int] NULL,
	[release_date] [datetimeoffset](7) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[lyrics] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[track_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Playlists]    Script Date: 5/28/2025 1:45:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playlists](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[title] [nvarchar](255) NULL,
	[createDate] [datetimeoffset](7) NULL,
	[imageUrl] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[privacy] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistTracks]    Script Date: 5/28/2025 1:45:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistTracks](
	[playlistId] [int] NOT NULL,
	[trackId] [int] NOT NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[playlistId] ASC,
	[trackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/28/2025 1:45:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[searchHistories]    Script Date: 5/28/2025 1:45:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[searchHistories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[searchQuery] [nvarchar](255) NULL,
	[timestamp] [time](7) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SequelizeMeta]    Script Date: 5/28/2025 1:45:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SequelizeMeta](
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tracks]    Script Date: 5/28/2025 1:45:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tracks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[trackUrl] [nvarchar](255) NULL,
	[imageUrl] [nvarchar](255) NULL,
	[uploaderId] [int] NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[status] [nvarchar](255) NOT NULL,
	[privacy] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/28/2025 1:45:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[roleId] [int] NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Birthday] [date] NULL,
	[Address] [nvarchar](255) NULL,
	[PhoneNumber] [nvarchar](255) NULL,
	[Avatar] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Likes] ON 

INSERT [dbo].[Likes] ([id], [userId], [trackId], [createdAt], [updatedAt]) VALUES (7, 2, 2, CAST(N'2025-04-18T06:48:06.4340000+00:00' AS DateTimeOffset), CAST(N'2025-04-18T06:48:06.4340000+00:00' AS DateTimeOffset))
INSERT [dbo].[Likes] ([id], [userId], [trackId], [createdAt], [updatedAt]) VALUES (1003, 1009, 1002, CAST(N'2025-05-20T14:53:27.8100000+00:00' AS DateTimeOffset), CAST(N'2025-05-20T14:53:27.8100000+00:00' AS DateTimeOffset))
INSERT [dbo].[Likes] ([id], [userId], [trackId], [createdAt], [updatedAt]) VALUES (1004, 1009, 1004, CAST(N'2025-05-20T14:55:18.2030000+00:00' AS DateTimeOffset), CAST(N'2025-05-20T14:55:18.2030000+00:00' AS DateTimeOffset))
INSERT [dbo].[Likes] ([id], [userId], [trackId], [createdAt], [updatedAt]) VALUES (1008, 1009, 1005, CAST(N'2025-05-20T14:59:14.3050000+00:00' AS DateTimeOffset), CAST(N'2025-05-20T14:59:14.3050000+00:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[Likes] OFF
GO
SET IDENTITY_INSERT [dbo].[listeningHistories] ON 

INSERT [dbo].[listeningHistories] ([id], [userId], [trackId], [listenCount], [createdAt], [updatedAt]) VALUES (2, 2, 2, 2, CAST(N'2025-04-19T01:49:47.9450000+00:00' AS DateTimeOffset), CAST(N'2025-04-19T01:49:51.1550000+00:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[listeningHistories] OFF
GO
INSERT [dbo].[Metadata] ([trackname], [track_id], [explicit], [danceability], [energy], [key], [loudness], [mode], [speechiness], [acousticness], [instrumentalness], [liveness], [valence], [tempo], [duration_ms], [time_signature], [year], [release_date], [createdAt], [updatedAt], [lyrics]) VALUES (N'Bạc Phận', 2, 0, 0.75, 0.8, 6, -5.8, 0, 0.04, 0.2, 0, 0.15, 0.7, 110, 200000, 3, 2022, CAST(N'2022-05-15T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-04-15T15:47:53.0000000+00:00' AS DateTimeOffset), CAST(N'2025-05-18T18:05:39.0980000+00:00' AS DateTimeOffset), N'Ai gieo tình này
Ai mang tình này
Để lệ trên khóe mi cay
Ai đưa về nhà
Ai cho ngọc ngà
Giờ người xa cách ta
Từng là một thời thiếu nữ
Trong vùng quê nghèo
Hồn nhiên cài hoa mái đầu
Dòng người vội vàng
Em hóa thân đời bẽ bàng
Rời xa tình anh năm tháng
Ôi phút giây tương phùng
Anh nhớ và mong
Dòng lưu bút năm xưa
In dấu mãi đậm sâu
Trong nỗi đau anh mệt nhoài
Trong phút giây anh tìm hoài
Muốn giữ em ở lại một lần này
Vì anh mãi thương
Xa cách nhau thật rồi
Sương trắng chiều thu
Ngày em bước ra đi
Nước mắt ấy biệt li
Hoa vẫn rơi bên thềm nhà
Lá xác xơ đi nhiều và
Anh chúc em yên bình
Mối tình mình hẹn em kiếp sau
Thoáng thoáng, ngày miên man
Giờ con nước dài thênh thang
Không trách, người không thương
Mà hương tóc còn vương vương
Gửi tặng em màu son cỏ dại
Chút bình yên trên môi bỏ lại
Nước mắt nào thấm đẫm cả hai vai
Mắt phượng mày ngài
Người phải tìm đến thiên thai
À ơi câu hát
Em không cần những lời khuyên
Em buông thả mình
Và chẳng màng đến tình duyên
Đời em phiêu bạc
Đau đớn lắm lúc cũng vì tiền
Thương thân em khổ
Để một lần cùng chí tuyến
Giờ em ở nơi khuê phòng
Ngày mai nữa em theo chồng
Và tô má em thêm hồng
Ôi đớn đau lòng ôi đớn đau lòng
Bình minh dẫn em đi rồi
Vòng xoay bánh xe luân hồi
Hoàng hôn khuất sau lưng đồi
Ôi vỡ tan rồi ôi vỡ tan rồi
Một ngày buồn mây tím
Em về thôn làng
Mẹ cha của em vỡ òa
Giọt lệ chạnh lòng em khóc
Thương người sang đò
Hồng nhan bạc phận sóng gió
Ôi phút giây tương phùng
Anh nhớ và mong
Dòng lưu bút năm xưa
In dấu mãi đậm sâu
Trong nỗi đau anh mệt nhoài
Trong phút giây anh tìm hoài
Muốn giữ em ở lại một lần này
Vì anh mãi thương
Xa cách nhau thật rồi
Sương trắng chiều thu
Ngày em bước ra đi
Nước mắt ấy biệt li
Hoa vẫn rơi bên thềm nhà
Lá xác xơ đi nhiều và
Anh chúc em yên bình
Mối tình mình hẹn em kiếp sau
Em ở nơi khuê phòng
Mai nữa em theo chồng
Tô má em thêm hồng
Ôi đớn đau lòng ôi đớn đau lòng
Bình minh dẫn em đi rồi
Vòng xoay bánh xe luân hồi
Hoàng hôn khuất sau lưng đồi
Ôi vỡ tan rồi ôi vỡ tan rồi
Xa cách nhau thật rồi
Sương trắng chiều thu
Ngày em bước ra đi
Nước mắt ấy biệt li
Hoa vẫn rơi bên thềm nhà
Lá xác xơ đi nhiều và
Anh chúc em yên bình
Mối tình mình hẹn em kiếp sau')
INSERT [dbo].[Metadata] ([trackname], [track_id], [explicit], [danceability], [energy], [key], [loudness], [mode], [speechiness], [acousticness], [instrumentalness], [liveness], [valence], [tempo], [duration_ms], [time_signature], [year], [release_date], [createdAt], [updatedAt], [lyrics]) VALUES (N'Bánh Mì Không', 1002, 1, 0.65, 0.7, 7, -7, 1, 0.06, 0.15, 0, 0.25, 0.6, 115, 220000, 4, 2021, CAST(N'2021-03-22T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-04-15T15:47:53.0000000+00:00' AS DateTimeOffset), CAST(N'2025-05-18T18:01:36.4040000+00:00' AS DateTimeOffset), N'Khi mà không còn yêu thì
Đêm nào ta cũng say vì
Không còn ai gọi ta về
Mau thật mau, đau thật đau
Căn nhà ta cùng thuê ở
Giờ đây đã có người thuê rồi
Người ta nhìn thật hạnh phúc
Bọn mình bơ vơ, thời mình ngu ngơ
Em thì quá bận với những khoản lo
Nhiều hôm ở công ty trễ lương
Thì tối ăn bánh mì
Bánh mì không, không có thịt luôn
Tay cầm đơn cầu mong
Anh có công việc mới
Phụ em lúc khó khăn
Những ngày tháng rất căng
Nhớ xưa còn nói nếu lúc mình giàu
Hai ta có nhà lầu
Và thêm xe hơi có đủ tất cả màu
Chiếc xe cùi bắp bể bánh ngoài đường
Hai ta thấy bình thường
Dù mồ hôi tuôn rơi
Nhưng có nhau đời thêm vui
Nhớ xưa mình thích những món lề đường
Hủ tiếu gõ và mì gói nước sôi
Thêm cái trứng gà
Đến nay điều ước cũng đã thành thật
Thành phố mỗi lúc càng chật
Ta mất nhau, dễ gì gặp lại nhau
Rối ren như trật tự giao thông đường phố
Lạc nhau rồi, thôi đừng cố
Đèn xanh, đèn đỏ rồi tới vàng
Dừng hay là chạy
Thì chuyện buồn ta vẫn mang
Tiếng rao thân thuộc
Của những quán quen xưa
Mỗi lần nghe thấy
Lòng như cắt, như cưa
Nhiều tiền anh biết
Bọn mình được ấm no
Mà tiền nhiều như thế
Nên tình cảm mình hóa tro
Ta sợ mình đói nên lao vào kiếm ăn
Rồi trái tim ta lạnh
Lạnh hơn một phiến băng
Ta vẫn chưa rõ
Tại sao mình thay đổi
Không ăn cùng nhau
Nhiều công việc nên hay vội
Có những bản nhạc
Không nên hát cùng nhau
Vì khi bài nhạc cất lên
Thì cả hai người cùng đau
Lúc nghèo rất vui
Những năm tháng thăng trầm ấy
Chứ không phải giống bây giờ
Anh mặc vest còn em diện váy đâu
Em thì quá bận với những khoản lo
Nhiều hôm ở công ty trễ lương
Thì tối ăn bánh mì
Bánh mì không, không có thịt luôn
Tay cầm đơn cầu mong
Anh có công việc mới
Phụ em lúc khó khăn
Những ngày tháng rất căng
Nhớ xưa còn nói nếu lúc mình giàu
Hai ta có nhà lầu
Và thêm xe hơi có đủ tất cả màu
Chiếc xe cùi bắp bể bánh ngoài đường
Hai ta thấy bình thường
Dù mồ hôi tuôn rơi
Nhưng có nhau đời thêm vui
Nhớ xưa mình thích những món lề đường
Hủ tiếu gõ và mì gói nước sôi
Thêm cái trứng gà
Đến nay điều ước cũng đã thành thật
Thành phố mỗi lúc càng chật
Ta mất nhau, câu chuyện cười thật đau
Em thì quá bận với những khoản lo
Nhiều hôm ở công ty trễ lương
Thì tối ăn bánh mì
Tay cầm đơn cầu mong
Anh có công việc mới
Phụ em lúc khó khăn
Những ngày tháng rất căng')
INSERT [dbo].[Metadata] ([trackname], [track_id], [explicit], [danceability], [energy], [key], [loudness], [mode], [speechiness], [acousticness], [instrumentalness], [liveness], [valence], [tempo], [duration_ms], [time_signature], [year], [release_date], [createdAt], [updatedAt], [lyrics]) VALUES (N'Quá Lâu', 1003, 0, 0.95, 0.95, 8, -4.5, 0, 0.03, 0.05, 0, 0.1, 0.9, 130, 180000, 4, 2020, CAST(N'2020-07-10T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-04-15T15:47:53.0000000+00:00' AS DateTimeOffset), CAST(N'2025-04-15T15:47:53.0000000+00:00' AS DateTimeOffset), N'Từng ngày bên em anh khó thêm
Vì không nói được ra
Là gần em anh luôn thấy đau
Anh luôn thấy cách xa
Vì tình bạn che đôi mắt em
Bao năm tháng ngày qua
Không bình thường như xưa giữa hai chúng ta
Em muốn chúng mình là gì?
Vì anh muốn chúng mình là hơn
Anh muốn chúng mình là hơn
Anh muốn chúng ta hơn là bạn
Em muốn chúng mình là gì?
Vì anh muốn chúng mình là hơn
Anh muốn chúng mình là hơn
Đã đến lúc chúng ta hạ màn
Anh đã thực sự yêu em quá lâu, quá lâu
Anh đã thực sự yêu em quá lâu
Không giấu em được nữa đâu
Anh đã thực sự yêu em quá lâu, quá lâu
Quá lâu, quá lâu, quá lâu
Em ơi hãy nghe anh muốn làm người đàn ông
Làm em thao thức để rình anh online suốt bao đêm dài
Làm em cười vì nhận được những tin nhắn anh đã viết lại
Làm em suy tư về từng câu chữ mà anh đã reply
Với những trái tim anh muốn nói gì hả
Và đã quá lâu anh giữ cảm xúc này lại
Vì anh mong mê say này sẽ nhanh phai
Nhưng tình yêu cho em mãi mãi quay lại
Mãi không phai, mãi điên dại
Em muốn chúng mình là gì?
Vì anh muốn chúng mình là hơn
Anh muốn chúng mình là hơn
Anh muốn chúng ta hơn là bạn
Em muốn chúng mình là gì?
Vì anh muốn chúng mình là hơn
Anh muốn chúng mình là hơn
Đã đến lúc chúng ta hạ màn
Anh đã thực sự yêu em quá lâu, quá lâu
Anh đã thực sự yêu em quá lâu
Không giấu em được nữa đâu
Anh đã thực sự yêu em quá lâu, quá lâu
Quá lâu, quá lâu, quá lâu
Và anh đã bên em mình luôn luôn có nhau
Nhưng em không nhận ra anh thường giấu nỗi đau
Vì em đã trói anh trong friendzone quá lâu
Anh đã thực sự yêu em quá lâu, quá lâu
Anh đã thực sự yêu em quá lâu (hey)
Không giấu em được nữa đâu
Anh đã thực sự yêu em quá lâu (hey), quá lâu (quá lâu, quá lâu)
Quá lâu (eh), quá lâu (oh), quá lâu
Anh đã thực sự yêu em quá lâu, quá lâu
Anh đã thực sự yêu em quá lâu (hey)
Không giấu em được nữa đâu
Anh đã thực sự yêu em quá lâu, quá lâu (quá lâu, quá lâu)
Quá lâu
Quá lâu (quá lâu)
Quá lâu-âu-ô')
INSERT [dbo].[Metadata] ([trackname], [track_id], [explicit], [danceability], [energy], [key], [loudness], [mode], [speechiness], [acousticness], [instrumentalness], [liveness], [valence], [tempo], [duration_ms], [time_signature], [year], [release_date], [createdAt], [updatedAt], [lyrics]) VALUES (N'Sóng Gió', 1004, 1, 0.55, 0.6, 4, -8, 1, 0.07, 0.3, 0, 0.3, 0.5, 105, 240000, 3, 2019, CAST(N'2019-11-05T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-04-15T15:47:53.0000000+00:00' AS DateTimeOffset), CAST(N'2025-04-15T15:47:53.0000000+00:00' AS DateTimeOffset), N'Hồng trần trên đôi cánh tay
Họa đời em trong phút giây
Từ ngày thơ ấy còn ngủ mơ
Đến khi em thờ ơ ờ
Lòng người anh đâu có hay
Một ngày khi vỗ cánh bay
Từ người yêu hóa thành người dưng
Đến khi ta tự xưng à
Thương em bờ vai nhỏ nhoi
Đôi mắt hóa mây đêm
Thương sao mùi dạ lý hương
Vương vấn mãi bên thềm
Đời phiêu du cố tìm
Một người thật lòng
Dẫu trời mênh mong anh nhớ em
Chim kia về vẫn có đôi
Sao chẳng số phu thê
Em ơi đừng xa cách tôi
Trăng cố níu em về
Bình yên trên mái nhà
Nhìn đời ngược dòng
Em còn bên anh có phải không?
Trời ban ánh sáng, năm tháng tư bề
Dáng ai về chung lối
Người mang tia nắng
Nhưng cớ sao còn tăm tối
Một mai em lỡ
Vấp ngã trên đời thay đổi
Nhìn về anh
Người chẳng khiến em lẻ loi
Oh! Nếu em có về
Anh sẽ mang hết những suy tư
Mang hết hành trang
Những ngày sống khổ
Để cho gió biển di cư
Anh thà lênh đênh
Không có ngày về
Hóa kiếp thân trai như Thủy Hử
Chẳng đành để em từ một cô bé
Sóng gió vây quanh thành quỷ dữ
Ta tự đẩy mình hay tự ta trói
Bây giờ có khác gì đâu
Ta chả bận lòng hay chẳng thể nói
Tụi mình có khác gì nhau
Yêu sao cánh điệp phủ mờ nét bút
Dẫu người chẳng hẹn đến về sau
Phố thị đèn màu ta chỉ cần chung lối
Để rồi sống chết cũng vì nhau
Nhặt một nhành hoa rơi
Đoạn đường về nhà thật buồn em ơi
Dòng người vội vàng giờ này
Tình ơi tình ơi tình ơi em ở đâu rồi
Lặng nhìn bờ vai xưa
Tựa đầu mình hỏi rằng khổ chưa
Đành lòng chặn đường giờ
Đừng đi đừng đi đừng đi vì câu hứa
Trời ban ánh sáng năm tháng tư bề
Dáng ai về chung lối
Người mang tia nắng
Nhưng cớ sao còn tăm tối
Một mai em lỡ vấp ngã
Trên đời thay đổi
Nhìn về anh
Người chẳng khiến em lẻ loi
Ngày buồn giờ áo
Ai khâu vá quàng rồi
Lặng nhìn dòng nước
Con sông phút bồi hồi
Một lần này hỡi em ơi ở lại đi
Vạn trùng cơn đau
Ngoài kia chỉ là bão tố
Trời ban ánh sáng năm tháng tư bề
Dáng ai về chung lối
Người mang tia nắng
Nhưng cớ sao còn tăm tối
Một mai em lỡ
Vấp ngã trên đời thay đổi
Nhìn về anh
Người chẳng khiến em lẻ loi
Người thì vẫn đây
Người thì cách vạn dậm ngàn mây
Không say không về
Rượu nào mà chả đắng
Đoạn đường dài giờ này quạnh vắng
Ai buông câu thề
Chỉ còn lại nỗi nhớ
Ngày nào chuyện tình mình vụn vỡ
Tơ duyên lỡ làng
Lùi lại về đằng xa
Cuộc đời mình chẳng bằng người ta
Tiếng lòng thở than')
INSERT [dbo].[Metadata] ([trackname], [track_id], [explicit], [danceability], [energy], [key], [loudness], [mode], [speechiness], [acousticness], [instrumentalness], [liveness], [valence], [tempo], [duration_ms], [time_signature], [year], [release_date], [createdAt], [updatedAt], [lyrics]) VALUES (N'Mạnh Bà', 1005, 0, 0.88, 0.92, 3, -3.5, 0, 0.02, 0.08, 0, 0.18, 0.85, 125, 190000, 4, 2023, CAST(N'2023-06-06T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-04-15T15:47:53.0000000+00:00' AS DateTimeOffset), CAST(N'2025-04-15T15:47:53.0000000+00:00' AS DateTimeOffset), N'Cơn mưa nặng thêm cố giấu nỗi đau trong tim
Duyên trần đã tan ôi nhân gian bỗng chốc điêu tàn
Tận chốn âm ty thôi quên đi còn tiếc thương gì
Người về nơi chốn thiên bồng sao tim Mạnh Bà còn trông
Nguyệt hạ tiên nhân đôi tay nối dây lương duyên
Cô đơn thân tàn phong kín Mạnh Bà cắt đi tơ tình
Đọng lại nơi đây lạnh lẽo tám giọt sầu cay
Mong sao uống bát canh Mạnh Bà đời quên hết nhân sinh
Trời đất gieo bao cuồng phong nhân gian chốn hoa mộng dần tàn
Chia ly ái tình vỡ tan
Gục ngã nơi bờ tăm tối than van hỏi cố nhân còn màng
Phận hồng nhan con tim vụn vỡ ngổn ngang
Tận đáy vong xuyên nàng vùi chôn sâu chấp mê ngày trùng phùng
Bỉ ngạn hoa khóc theo cùng
Đời kiếp ai người ngâm mãi khúc ly ca xót xa nay hóa thân già
Uống canh Mạnh Bà liệu có quên bóng chàng
Nguyệt hạ tiên nhân đôi tay nối dây lương duyên
Cô đơn thân tàn phong kín Mạnh Bà cắt đi tơ tình (cắt đi)
Đọng lại nơi đây lạnh lẽo tám giọt sầu cay
Mong sao uống bát canh Mạnh Bà đời quên hết nhân sinh
Trời đất gieo bao cuồng phong nhân gian chốn hoa mộng dần tàn
Chia ly ái tình vỡ tan
Gục ngã nơi bờ tăm tối than van hỏi cố nhân còn màng
Phận hồng nhan con tim vụn vỡ ngổn ngang
Tận đáy vong xuyên nàng vùi chôn sâu chấp mê ngày trùng phùng
Bỉ ngạn hoa khóc theo cùng
Đời kiếp ai người ngâm mãi khúc ly ca xót xa nay hóa thân già
Uống canh Mạnh Bà liệu có quên bóng chàng
Hỏi ai hóa bi sầu tình duyên (hỏi ai)
Uất hận bóng trăng ngả nghiêng
Hẹn nối dây tơ hồng trọn đôi
Trùng dương giờ hai hướng ngược lối
Trời đất gieo bao cuồng phong nhân gian chốn hoa mộng dần tàn
Chia ly ái tình vỡ tan
Gục ngã nơi bờ tăm tối than van hỏi cố nhân còn màng
Phận hồng nhan con tim vụn vỡ ngổn ngang')
INSERT [dbo].[Metadata] ([trackname], [track_id], [explicit], [danceability], [energy], [key], [loudness], [mode], [speechiness], [acousticness], [instrumentalness], [liveness], [valence], [tempo], [duration_ms], [time_signature], [year], [release_date], [createdAt], [updatedAt], [lyrics]) VALUES (N'Hơn Cả Mây Trời', 1006, 1, 0.63, 0.67, 2, -9, 1, 0.05, 0.25, 0, 0.22, 0.55, 118, 230000, 3, 2021, CAST(N'2021-09-09T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-04-15T15:47:53.0000000+00:00' AS DateTimeOffset), CAST(N'2025-04-15T15:47:53.0000000+00:00' AS DateTimeOffset), N'Nói yêu anh đi
Khi em đang còn trẻ
Em không thuộc về ai
Chuyện tình còn
Chưa phai và
Nói yêu anh đi
Khi anh đang cần em
Khi anh còn
Thương em nhiều lắm
Nhiều hơn cách em
đã từng thương người ta
Nhiều hơn cả mây trời
Cả cuộc đời không ai
Bằng anh đâu
Baby anh muốn nói
Anh yêu em
Dù bấy lâu anh chỉ
Cất giữ ở trong tim
Chẳng thể nói lên lời
Cảm xúc kia rối bời anh biết
Baby anh sẽ mãi mãi yêu em
Dù muôn đời sau
Lắm bão tố với bon chen
Chẳng thể nào cách rời
Vì trái tim anh
Luôn dành cho em
Chuyến xe nào
Mà chẳng có điểm dừng
Theo đuổi em
Thì anh chẳng muốn ngưng
Thanh xuân này
Có em sẽ thật đẹp
Anh sẽ hết buồn
Mí mắt sẽ hết sưng
Chí phèo lúc say
Thường nhớ về Thị Nở
Còn anh lúc buồn
Thường nhớ về nàng thơ
Không lấy rượu
Trút vào từng hơi thở
Ngày nhớ về người
Tối về lại ôm mơ
Em ơi !
Có những buổi chiều
Anh vội vã
Bon chen ngoài đường
Khi cơn mưa đang tầm tã
Vật lộn cả ngày
Với nỗi nhớ không mang tên
Bài hát đong đầy
Một giọng nói
Anh không quên
Anh vẫn rất sợ
Sợ ngày nào đó sẽ mất em
Sợ sẽ phải nhìn
Dòng tin nhắn
Em đã xem
Sợ những ngày dài sẽ rối ren
Sợ đôi mắt anh sẽ ướt nhèm
Baby anh muốn nói
Anh yêu em
Dù bấy lâu anh chỉ
Cất giữ ở trong tim
Chẳng thể nói lên lời
Cảm xúc kia rối bời anh biết
Baby anh sẽ mãi mãi yêu em
Dù muôn đời sau
Lắm bão tố với bon chen
Chẳng thể nào cách rời
Vì trái tim anh
Luôn dành cho em')
INSERT [dbo].[Metadata] ([trackname], [track_id], [explicit], [danceability], [energy], [key], [loudness], [mode], [speechiness], [acousticness], [instrumentalness], [liveness], [valence], [tempo], [duration_ms], [time_signature], [year], [release_date], [createdAt], [updatedAt], [lyrics]) VALUES (N'Cao Ốc 20', 1007, 0, 0.77, 0.85, 1, -6.5, 0, 0.04, 0.18, 0, 0.19, 0.75, 122, 205000, 4, 2020, CAST(N'2020-12-12T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-04-15T15:47:53.0000000+00:00' AS DateTimeOffset), CAST(N'2025-04-15T15:47:53.0000000+00:00' AS DateTimeOffset), N'Mưa sẽ không còn rơi
Nước mắt rồi cũng khô
Và tim em sẽ không còn đợi
Những món quà kỉ niệm
Một thời gian sẽ không dòm tới
Và anh sẽ thoáng qua trong tâm trí em
Là một kẻ lạ
Em gặp ở trong dòng đời
Em sẽ quên
Quên cả những vị ngọt và đắng
Quên ngày đó cả hai đã thua
Khi đã chọn mình thắng
Quên là anh đáng yêu
Hay quên là anh đáng hận
Quên một người đã có thể
Từng làm em yêu hơn bản thân
Quên thứ tình cảm nặng nhất
Khi phải đặt lên cán cân
Quên vết thương làm em đau nhất
Và đem nó nhân vạn lần
Quên những lời ca anh viết
Từng chi tiết về anh
Từng nụ hôn từng tin nhắn
Mà anh không biết để dành
Em ơi tất cả nỗi nhớ này để đâu
Anh mang theo nó chẳng thể lâu
Những thước phim những câu chuyện
Tựa như giấc chiêm bao
Một ngày nào đó
Em sẽ quên là ta đã mất đi nhau
Và rồi anh cũng sẽ phải nhận ra
Em đã đi xa từ hôm qua
Và những ký ức lúc trước
Sau này chỉ là những điều khác lạ
Nói với nhau một câu đi để sau này
Ta không lưu luyến đến nhau
Vì anh mang theo
Nỗi nhớ này chẳng thể lâu
Khi em đi anh dùng thay thế
Là điếu thuốc lá và cà phê
Những buổi tiệc không đường về
Và những tin nhắn giờ đã trễ
Anh như món đồ thất lạc
Không có nơi trả về
Nhưng nếu không mất sẽ không tìm
Thường thì đời là thế
Anh nghĩ về quá khứ
Không tính chuyện tương lai
Em không bên anh hiện tại
Nhưng vẫn thấy em thường ngày
Những thước phim những lời nhạc cấu xé
Những câu chuyện chỉ buồn cười
Khi ta kể nhau nghe
Anh trở về thành phố này
Đều là đã từng
Mang theo những kỉ niệm
Giờ em chả cần
Mẹ anh nói đây là nợ
Anh phải trả dần
Nhưng bao lâu là điều duy nhất
Mẹ không thể nói ra
Đứng trên lầu 20 của tòa cao ốc
Chỉ để hút c** và ăn tối
Với những cô gái nói lời yêu thương
Khi gặp vài lần là chăn gối
Vài người bạn vẫn luôn có mặt
Đỡ một phần nào tăm tối
Những tin nhắn dài anh gửi cho em
Nhưng anh chưa từng làm văn giỏi
Anh chỉ muốn
Có những cảm giác mà họ nói
Anh muốn một lần tự do
Muốn một lần được bỏ trói
Muốn gặp em ngày đó
Muốn là anh hôm qua
Muốn cảm nhận lời em nói
Theo một cách nôm na
Nhưng mà
Tất cả nỗi nhớ này để đâu
Tất cả nỗi nhớ này để đâu
Em ơi tất cả nỗi nhớ này để đâu
Anh mang theo nó chẳng thể lâu
Áng mây kia rong chơi lâu rồi
Thành phố sau lưng anh buồn
Vậy đâu là điều em muốn
Áng mây kia đã quên anh rồi
Đừng bắt cơn đau dài thêm
Vì anh mang chẳng thể lâu')
INSERT [dbo].[Metadata] ([trackname], [track_id], [explicit], [danceability], [energy], [key], [loudness], [mode], [speechiness], [acousticness], [instrumentalness], [liveness], [valence], [tempo], [duration_ms], [time_signature], [year], [release_date], [createdAt], [updatedAt], [lyrics]) VALUES (N'Chạm Khẽ Tim Anh', 1008, 1, 0.72, 0.78, 0, -7.2, 1, 0.06, 0.12, 0, 0.26, 0.65, 108, 195000, 3, 2018, CAST(N'2018-02-14T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-04-15T15:47:53.0000000+00:00' AS DateTimeOffset), CAST(N'2025-04-15T15:47:53.0000000+00:00' AS DateTimeOffset), N'Chạm nhẹ vào đôi mắt
Chạm nhẹ vào bờ vai
Chạm nhẹ vào đôi môi
Ngày mai xa anh rồi
Chạm nhẹ vào trí nhớ
Chạm nhẹ vào cơn mơ
Mình đã chạm khẽ vào nhau
Những ngày ngây thơ
Anh yêu cô gái nhỏ bé
Tin vào những lời bài hát
Tin rằng nếu khóc trong mưa
Sẽ bớt đau hơn
Anh yêu cô gái năm ấy
Tin vào những điều viển vông
Rằng tay và tay sẽ nắm lấy nhau
Tận cuối cuộc đời
Thời gian xoá đi những ngây thơ
Những điều vội vàng như trong giấc mơ
Để lại những cơn đau vu vơ
Chẳng còn bất ngờ
Một mai sớm kia em có thấy
Giữa lồng ngực mình đau khi nhớ anh
Thì đừng vội khóc hãy xiết tay anh
Nơi em bình yên
Đừng hôn nếu môi em chưa quên
Dư vị ngọt ngào hai ta đã trao
Đừng ôm nếu em thấy anh ta
Chẳng thể vỗ về
Đừng tin nếu chia tay anh ta nói rằng
Mình không xứng đáng với em
Và đừng vội khóc
Anh vẫn ở đây cho em bình yên
Chạm khẽ tim anh một chút thôi
Mai xa rồi
Chạm nhẹ vào đôi mắt
Chạm nhẹ vào bờ vai
Chạm nhẹ vào đôi môi
Ngày mai xa anh rồi
Chạm nhẹ vào trí nhớ
Chạm nhẹ vào cơn mơ
Mình đã chạm khẽ vào nhau
Những ngày ngây thơ
Anh yêu cô gái nhỏ bé
Tin vào những lời bài hát
Tin rằng nếu khóc trong mưa
Sẽ bớt đau hơn
Anh yêu cô gái năm ấy
Tin vào những điều viển vông
Rằng tay và tay sẽ nắm lấy nhau
Tận cuối cuộc đời
Thời gian xoá đi những ngây thơ
Những điều vội vàng như trong giấc mơ
Để lại những cơn đau vu vơ
Chẳng còn bất ngờ
Một mai sớm kia em có thấy
Giữa lồng ngực mình đau khi nhớ anh
Thì đừng vội khóc hãy xiết tay anh
Nơi em bình yên
Đừng hôn nếu môi em chưa quên
Dư vị ngọt ngào hai ta đã trao
Đừng ôm nếu em thấy anh ta
Chẳng thể vỗ về
Đừng tin nếu chia tay anh ta nói rằng
Mình không xứng đáng với em
Và đừng vội khóc
Anh vẫn ở đây cho em bình yên
Thời gian xoá đi những ngây thơ
Những điều vội vàng như trong giấc mơ
Để lại những cơn đau vu vơ
Chẳng còn bất ngờ
Một mai sớm kia em có thấy
Giữa lồng ngực mình đau khi nhớ anh
Thì đừng vội khóc hãy xiết tay anh
Nơi em bình yên
Đừng hôn nếu môi em chưa quên
Dư vị ngọt ngào hai ta đã trao
Đừng ôm nếu em thấy anh ta
Chẳng thể vỗ về
Đừng tin nếu chia tay anh ta nói rằng
Mình không xứng đáng với em
Và đừng vội khóc
Anh vẫn ở đây cho em bình yên
Chạm khẽ tim anh một chút thôi
Mai xa rồi')
INSERT [dbo].[Metadata] ([trackname], [track_id], [explicit], [danceability], [energy], [key], [loudness], [mode], [speechiness], [acousticness], [instrumentalness], [liveness], [valence], [tempo], [duration_ms], [time_signature], [year], [release_date], [createdAt], [updatedAt], [lyrics]) VALUES (N'Em Gì Ơi', 1009, 0, 0.9, 0.95, 9, -5, 0, 0.03, 0.1, 0, 0.12, 0.95, 135, 175000, 4, 2024, CAST(N'2024-04-04T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-04-15T15:47:53.0000000+00:00' AS DateTimeOffset), CAST(N'2025-04-15T15:47:53.0000000+00:00' AS DateTimeOffset), N'Xin đừng khóc như thế
Bao nhiêu niềm đau chôn dấu
Mong ngày sẽ trôi mau
Đời phong ba, độc thân bước chân Sơn Hà
Buổi sáng hôm ấy
Khi còn trắng sương bay
Ta như là gió phiêu lãng
Mang hành lý thương nhớ
Chẳng sao đâu, sầu bi có khi còn lâu
Lạc mình trong cánh buồm phiêu du
Chiếc thuyền đong đưa
Những ngày xa xưa
Bé nhỏ hay thưa Mẹ thưa Cha
Rằng con đi học mới về
Giờ tung bay, khúc nhạc mê say
Nỗi lòng tha hương, vướng đường tương lai
Ước rằng ngày mai nắng lên
Ngày mai nắng lên ta sẽ quên
Này này này là em gì ơi
Em gì ơi, em gì ơi!
Ở lại và yêu được không
Yêu được không, yêu được không
Thật lòng này ta chỉ mong ta chỉ mong
Bên dòng sông, người có nhớ có trông ai...
Việc gì phải ôm buồn đau
Riêng mình ta riêng mình ta
Nụ cười nở muôn ngàn hoa
Muôn ngàn hoa, muôn ngàn hoa
Cuộc đời này thật là vui biết bao
Trời cao núi xanh mây ngàn sao
Khi bánh xe còn lăn bánh
Khi bánh xe còn lăn bánh
Ta xoay vòng với cuộc sống hối hả
Quên đi mộng ước thanh xuân đã trôi qua
Ta ngại va chạm khi nhiều lần dối trá
Những lần áp lực bởi công việc muốn đi xa
Vứt hết một lần trước khi nhìn đời thoái hóa
Tự do tự tại như chim trời và thi ca
Bước qua nà
Đời nhiều lúc cảm thấy rất nhiều trò
Thôi ta giang tay ôm lấy cả bầu trời!
Hỡi bạn thân ơi! Lá mù u rơi
Khát vọng ra khơi, chúng mình đi chơi
Bước thật hiên ngang, lối về thênh thang
Chẳng cần cao sang, nỗi lòng sang trang và từ nay
Lạc mình trong cánh buồm phiêu du
Chiếc thuyền đong đưa
Những ngày xa xưa
Bé nhỏ hay thưa Mẹ thưa Cha
Rằng con đi học mới về
Giờ tung bay, khúc nhạc mê say
Nỗi lòng tha hương, vướng đường tương lai
Ước rằng ngày mai nắng lên
Ngày mai nắng lên ta sẽ quên
Này này này là em gì ơi
Em gì ơi, em gì ơi!
Ở lại và yêu được không
Yêu được không, yêu được không
Thật lòng này ta chỉ mong ta chỉ mong
Bên dòng sông, người có nhớ có trông ai...
Việc gì phải ôm buồn đau
Riêng mình ta riêng mình ta
Nụ cười nở muôn ngàn hoa
Muôn ngàn hoa, muôn ngàn hoa
Cuộc đời này thật là vui biết bao
Trời cao núi xanh mây ngàn sao
Này này này là em gì ơi
Em gì ơi, em gì ơi!
Ở lại và yêu được không
Yêu được không, yêu được không
Thật lòng này ta chỉ mong ta chỉ mong
Bên dòng sông, người có nhớ có trông ai...
Việc gì phải ôm buồn đau
Riêng mình ta riêng mình ta
Nụ cười nở muôn ngàn hoa
Muôn ngàn hoa, muôn ngàn hoa
Cuộc đời này thật là vui biết bao
Trời cao núi xanh mây ngàn sao')
INSERT [dbo].[Metadata] ([trackname], [track_id], [explicit], [danceability], [energy], [key], [loudness], [mode], [speechiness], [acousticness], [instrumentalness], [liveness], [valence], [tempo], [duration_ms], [time_signature], [year], [release_date], [createdAt], [updatedAt], [lyrics]) VALUES (N'Có Đáng Để Yêu Thương', 1010, 0, 0.75, 0.8, 6, -5.8, 0, 0.04, 0.2, 0, 0.15, 0.7, 110, 200000, 3, 2022, CAST(N'2022-05-15T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-04-15T15:47:53.0000000+00:00' AS DateTimeOffset), CAST(N'2025-05-15T15:25:43.7730000+00:00' AS DateTimeOffset), N'Sẽ đến lúc em chợt nhận ra
Xung quanh chỉ toàn là xót xa
Tự nhìn xem em quá tổn thương
Quá nhiều nỗi buồn vương
Đêm về tự cười trước gương
Vẽ ký ức đến khi tàn phai
Em biết sai khi cố chờ ai
Dù cho có là điều nhỏ nhất
Cũng chẳng có mà mất
Em tự phải ôm lấy em
Bao nhiêu niềm đau ở trên cõi đời
Ngày em đi em sẽ trả lời
Cứ đem con tim chơi vơi
Mong đợi một cơn mưa rơi
Một bài hát cất lên không lời
Người ta cũng cứ thế xa rời
Người khách không mời
Em ơi em lại chơi vơi
Chẳng lẽ em lại không đáng để yêu thương
Hay tình yêu của em
Quá đỗi tầm thường
Thời gian đẹp nhất gọi là thanh xuân
Vậy thì thanh xuân em đâu
Ngồi lặng yên bên hiên
Có một cơn mưa
Câu hỏi cũ hiện lên
Biết sao cho vừa
Tình yêu rộng lớn cho người cô đơn
Thôi em tìm về chính em
Sẽ tốt hơn
Giữa thành phố trong màn mưa
Em chẳng có một người đưa
Có phải đã đến mức dư thừa
Thì thôi tàn nhẫn một lần
Hơn đau trăm lần
Đâu còn điều chi đến nỗi bận tâm
Chỉ là lời hứa phía sau nụ cười
Đã làm em cứ ngỡ mặt trời
Tình yêu vốn dĩ chỉ là
Đớn đau thôi mà
Chờ trôi những tháng ngày qua
Đếm ánh sao ngập tràn trên cao
Có nước mắt ai tuôn trào
Ánh đèn đường rọi theo
Bước em về nơi cô đơn
Rồi ngày mai đến
Cũng chẳng một người bên em
Tự hát khúc ca êm đềm
Mây giữa trời
Em ơi cứ hoài chơi vơi
Chẳng lẽ em lại không đáng để yêu thương
Hay tình yêu của em
Quá đỗi tầm thường
Thời gian đẹp nhất gọi là thanh xuân
Vậy thì thanh xuân em đâu
Ngồi lặng yên bên hiên
Có một cơn mưa
Câu hỏi cũ hiện lên
Biết sao cho vừa
Tình yêu rộng lớn cho người cô đơn
Thôi em tìm về chính em
Sẽ tốt hơn
Chẳng lẽ em lại không đáng để yêu thương
Hay tình yêu của em
Quá đỗi tầm thường
Thời gian đẹp nhất gọi là thanh xuân
Vậy thì thanh xuân em đâu
Ngồi lặng yên bên hiên
Có một cơn mưa
Câu hỏi cũ hiện lên
Biết sao cho vừa
Tình yêu rộng lớn cho người cô đơn
Thôi em tìm về chính em chính em')
INSERT [dbo].[Metadata] ([trackname], [track_id], [explicit], [danceability], [energy], [key], [loudness], [mode], [speechiness], [acousticness], [instrumentalness], [liveness], [valence], [tempo], [duration_ms], [time_signature], [year], [release_date], [createdAt], [updatedAt], [lyrics]) VALUES (N'Thất Tình', 1021, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 345312, 4, 2025, CAST(N'2025-05-13T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-05-13T17:45:15.4130000+00:00' AS DateTimeOffset), CAST(N'2025-05-13T17:45:15.4130000+00:00' AS DateTimeOffset), N'Anh đã không giữ được nhiều hạnh phúc cho em
Nhiều khi giận nhau, nước mắt em cứ rơi thật nhiều
Anh xin lỗi em, hãy tha thứ cho anh lần này
Đừng rời xa anh, em nói đi, "Em rất yêu anh"
Nhưng nay cuộc sống, không như anh đã ước mong
Của một tình yêu sẽ hạnh phúc giống như bao người
Một người yêu em, yêu em đắm say
Một người bên em, bên em mỗi khi
Mà giờ đây, nước mắt anh đã rơi rồi
Thật ra anh đâu, đâu có muốn chia tay như vậy
Người yêu em hỡi, anh lại nhớ em đang ở đâu
Bàn tay nhỏ bé, khuôn mặt ấy sao lại đổi thay để anh nơi này?
Ngoài trời mưa cứ rơi lặng thầm, chỉ còn riêng anh
Thật sự nhiều khi, muốn nhắn tin gửi cho em nhiều
Lại sợ người ấy, đang hạnh phúc vui bên một ai
Tình yêu đã chết, hai người dưng mai này chúng ta có duyên gặp lại
Thì anh vẫn luôn luôn yêu em như lúc mới yêu
Anh đã không giữ được nhiều hạnh phúc cho em
Nhiều khi giận nhau, nước mắt em cứ rơi thật nhiều
Anh xin lỗi em, hãy tha thứ cho anh lần này
Đừng rời xa anh, em nói đi, "Em rất yêu anh"
Nhưng nay cuộc sống, không như anh đã ước mong
Của một tình yêu sẽ hạnh phúc giống như bao người
Một người yêu em, yêu em đắm say
Một người bên em, bên em mỗi khi
Mà giờ đây, nước mắt anh đã rơi rồi
Thật ra anh đâu, đâu có muốn chia tay như vậy
Người yêu em hỡi, anh lại nhớ em đang ở đâu
Bàn tay nhỏ bé, khuôn mặt ấy sao lại đổi thay để anh nơi này?
Ngoài trời mưa cứ rơi lặng thầm, chỉ còn riêng anh
Thật sự nhiều khi, muốn nhắn tin gửi cho em nhiều
Lại sợ người ấy, đang hạnh phúc vui bên một ai
Tình yêu đã chết, hai người dưng mai này chúng ta có duyên gặp lại
Thì anh vẫn luôn luôn yêu em như lúc mới yêu
Thật ra anh đâu, đâu có muốn chia tay như vậy
Người yêu em hỡi, anh lại nhớ em đang ở đâu
Bàn tay nhỏ bé, khuôn mặt ấy sao lại đổi thay để anh nơi này?
Ngoài trời mưa cứ rơi lặng thầm, chỉ còn riêng anh
Thật sự nhiều khi, muốn nhắn tin gửi cho em nhiều
Lại sợ người ấy, đang hạnh phúc vui bên một ai
Tình yêu đã chết, hai người dưng mai này chúng ta có duyên gặp lại
Thì anh vẫn luôn luôn yêu em như lúc mới yêu')
INSERT [dbo].[Metadata] ([trackname], [track_id], [explicit], [danceability], [energy], [key], [loudness], [mode], [speechiness], [acousticness], [instrumentalness], [liveness], [valence], [tempo], [duration_ms], [time_signature], [year], [release_date], [createdAt], [updatedAt], [lyrics]) VALUES (N'Chúng Ta Của Hiện Tại', 1022, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 301583, 4, 2025, CAST(N'2025-05-14T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-05-14T10:14:50.5170000+00:00' AS DateTimeOffset), CAST(N'2025-05-18T17:59:17.4660000+00:00' AS DateTimeOffset), N'Mùa thu mang giấc mơ quay về
Vẫn nguyên vẹn như hôm nào
Lá bay theo gió xôn xao
Chốn xưa em chờ (chốn xưa em chờ)
Đoạn đường ngày nào nơi ta từng đón đưa
Còn vấn vương không phai mờ
Giấu yêu thương trong vần thơ
Chúng ta...
Là áng mây bên trời vội vàng ngang qua
Chúng ta...
Chẳng thể nâng niu những câu thề
Cứ như vậy thôi, không một lời, lặng lẽ thế chia xa
Chiều mưa bên hiên vắng buồn
Còn ai thương ai, mong ai?
Điều anh luôn giữ kín trong tim
Thương em đôi mắt ướt nhòa
Điều anh luôn giữ kín trong tim này
Thương em đâu đó khóc òa
Điều anh luôn giữ kín trong tim này
Ngày mai nắng gió, sương hao gầy
Có ai thương, lắng lo cho em? (Whoo-whoo-whoo)
Điều anh luôn giữ kín trong tim
Thương em, anh mãi xin là
Điều anh luôn giữ kín trong tim này
Thương em vì thương thôi mà
Điều anh luôn giữ kín trong tim này
Dù cho nắng tắt, xuân thay màu
Héo khô đi tháng năm xưa kia
(Anh nguyện ghi mãi trong tim)
"Nắng vương trên cành héo khô những kỉ niệm xưa kia"
"Ngày mai, người luyến lưu về giấc mơ từng có, liệu có ta?"
Có anh nơi đó không?
Có anh nơi đó không?
(Liệu có ta?)
Chúng ta...
Là áng mây bên trời vội vàng ngang qua
Chúng ta...
Chẳng thể nâng niu những câu thề
Cứ như vậy thôi, không một lời, lặng lẽ thế chia xa
Chiều mưa bên hiên vắng buồn
Còn ai thương ai, mong ai?
Điều anh luôn giữ kín trong tim
Thương em đôi mắt ướt nhòa
Điều anh luôn giữ kín trong tim này
Thương em đâu đó khóc òa
Điều anh luôn giữ kín trong tim này
Ngày mai nắng gió, sương hao gầy
Có ai thương, lắng lo cho em? (Whoo-whoo-whoo)
Điều anh luôn giữ kín trong tim
Thương em, anh mãi xin là
Điều anh luôn giữ kín trong tim này
Thương em vì thương thôi mà
Điều anh luôn giữ kín trong tim này
Dù cho nắng tắt, xuân thay màu
Héo khô đi tháng năm xưa kia
(Anh nguyện ghi mãi trong tim)
No, no, no
No, no, no
Điều anh luôn giữ kín trong tim (giữ kín trong tim này)
Giữ mãi trong tim này (giữ mãi trong tim này)
Giữ mãi trong tim mình (giữ mãi trong tim mình)
Giữ...
Có anh nơi đó không?
Có anh nơi đó không?
(Whoo-whoo-whoo-whoo)
Điều anh luôn giữ kín trong tim (no, no)
Điều anh luôn giữ kín trong tim này (no, no)
Điều anh luôn giữ kín trong tim này
(Ngày mai, nắng gió, sương hao gầy)
(Có ai thương, lắng lo cho em?)
Điều anh luôn giữ kín trong tim (no, no)
Điều anh luôn giữ kín trong tim này (no, no)
Điều anh luôn giữ kín trong tim này
(Dù cho nắng tắt, xuân thay màu)
(Héo khô đi tháng năm xưa kia)
(Anh nguyện ghi mãi trong tim)
Điều anh luôn giữ kín trong tim
Thương em đôi mắt ướt nhòa
Điều anh luôn giữ kín trong tim này
Thương em đâu đó khóc òa
Điều anh luôn giữ kín trong tim này
Ngày mai nắng gió, sương hao gầy
Có ai thương, lắng lo cho em? (Whoo-whoo-whoo)
Điều anh luôn giữ kín trong tim
Thương em, anh mãi xin là
Điều anh luôn giữ kín trong tim này
Thương em vì thương thôi mà
Điều anh luôn giữ kín trong tim này
Dù cho nắng tắt, xuân thay màu
Héo khô đi tháng năm xưa kia
(Anh nguyện ghi mãi trong tim)')
INSERT [dbo].[Metadata] ([trackname], [track_id], [explicit], [danceability], [energy], [key], [loudness], [mode], [speechiness], [acousticness], [instrumentalness], [liveness], [valence], [tempo], [duration_ms], [time_signature], [year], [release_date], [createdAt], [updatedAt], [lyrics]) VALUES (N'Chiếc Khăn Gió Ấm', 1023, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 231549, 4, 2025, CAST(N'2025-05-14T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-05-14T15:47:45.2170000+00:00' AS DateTimeOffset), CAST(N'2025-05-18T18:04:31.0800000+00:00' AS DateTimeOffset), N'Ở bên kia bầu trời về đêm chắc đang lạnh dần
Và em giờ đang chìm trong giấc mơ êm đềm
Gửi mâу mang vào phòng vòng taу của anh nồng nàn
Nhẹ nhàng ôm cho em уên giấc ngủ ngon
Ở bên đâу bầu trời thì mưa cứ rơi hững hờ
Để tim anh cồn cào và da diết trong nỗi nhớ
Dường như anh nhớ về em
Gửi cho em đêm lung linh và tiếng sóng nơi biển lớn
Gửi em những ngôi sao trên cao tặng em chiếc khăn gió ấm
Để em thấу chẳng hề cô đơn
Để em thấу mình gần bên nhau
Để em vững tin vào tình уêu hai chúng ta
Rồi cơn mưa đêm qua đi ngàу mai lúc em thức giấc
Nắng mai sẽ hôn lên môi em nụ hôn của anh ấm áp
Và em hãу cười nhiều em nhé
Vì em mãi là niềm hạnh phúc
Ϲủa anh mà thôi
Ở bên kia bầu trời về đêm chắc đang lạnh dần
Và em giờ đang chìm trong giấc mơ êm đềm
Gửi mâу mang vào phòng vòng taу của anh nồng nàn
Nhẹ nhàng ôm cho em уên giấc ngủ ngon
Ở bên đâу bầu trời thì mưa cứ rơi hững hờ
Để tim anh cồn cào và da diết trong nỗi nhớ
Dường như anh nhớ đến em
I miss you, honey
Gửi cho em đêm lung linh và tiếng sóng nơi biển lớn
Gửi em những ngôi sao trên cao tặng em chiếc khăn gió ấm
Để em thấу chẳng hề cô đơn
Để em thấу mình gần bên nhau
Để em vững tin vào tình уêu hai chúng ta
Rồi cơn mưa đêm qua đi ngàу mai lúc em thức giấc
Nắng mai sẽ hôn lên môi em nụ hôn của anh ấm áp
Và em hãу cười nhiều em nhé
Vì em mãi là niềm hạnh phúc
Ϲủa anh mà thôi
Gửi cho em đêm lung linh và tiếng sóng nơi biển lớn
Gửi em những ngôi sao trên cao tặng em chiếc khăn gió ấm
Để em thấу chẳng hề cô đơn
Để em thấу mình gần bên nhau
Để em vững tin vào tình уêu hai chúng ta
Rồi cơn mưa đêm qua đi ngàу mai lúc em thức giấc
Nắng mai sẽ hôn lên môi em nụ hôn của anh ấm áp
Và em hãу cười nhiều em nhé
Vì em mãi là niềm hạnh phúc
Ϲủa anh mà thôi
Gửi cho em bao nụ hôn, bao nhiêu tình yêu trong đời
Gửi cho em chiếc khăn gió ấm trong bao đêm lạnh mùa đông
Còn lại gì cho nhau bao yêu thương ta vẫn giữ trong lòng
Sẽ mãi yêu em mà thôi, sẽ mãi yêu em mà thôi
Nơi đây nơi đây anh vẫn chờ em, chờ em, chờ em về
Bởi yêu thương ghé qua sẽ không, sẽ không, sẽ không còn não nề
Oh babe babe babe, oh babe babe babe
Oh babe babe babe
Chiếc khăn gió ấm')
INSERT [dbo].[Metadata] ([trackname], [track_id], [explicit], [danceability], [energy], [key], [loudness], [mode], [speechiness], [acousticness], [instrumentalness], [liveness], [valence], [tempo], [duration_ms], [time_signature], [year], [release_date], [createdAt], [updatedAt], [lyrics]) VALUES (N'Người Ơi Đừng Về', 1028, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 268382, 4, 2025, CAST(N'2025-05-18T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-05-18T15:05:21.4160000+00:00' AS DateTimeOffset), CAST(N'2025-05-18T15:05:21.4160000+00:00' AS DateTimeOffset), N'Lâu nay chưa gặp nhau đấy
Hay ta quên số nhau vậy?
Nghe đâu lúc này bận lắm
Chẳng đi chơi, chẳng đi chơi nhiều
Nhân đây chưa kịp ăn tối
Hôm nay cuối tuần rồi
Sao ta không gặp nhau
Cả lũ đi chơi, rủ đi chơi
Mình sẽ xuống phố rộn ràng, ngồi ăn bánh xong uống trà
Dẹp hết mấy thứ mệt nhoài làm u ám bao ngày qua
Đừng cứ kiếm cớ đòi về, cuộc vui vẫn chưa xong mà
Mình còn tăng hai
Và còn tăng ba
Đừng về trước nha
Người ơi, người ở í a đừng về
Làm sao, làm sao để vui một khi vắng đi một người
Người ơi, người ở í a đừng về
Lâu lâu mới vui như vậy, bao lâu mới gặp lại đây
Người ở đừng về
Hi!
Alo alo alo alo
Bao nhiêu lâu chưa gặp
Ra đây chơi đi, yes or no?
Bây giờ n-sao nà
Em đang làm gì đấy?
Ra đây công viên có đâu mà lâu, khoác cái áo, phi xuống lầu nà
Ok, hai mươi cứ cho là mau (alo alo)
Loay hoay lâu nay thấy đâu mặt nhau (ô ai kia)
Đừng bao giờ nghĩ là vui sau
Ra đây mà chơi với tui mau
Thay vì nằm nhà mà coi troll
Cả tuần làm việc rồi mới cần ra đây ngồi
Tới khuya, trân châu, mồi
Tía lia không cần vội, ối a
Thì đấy
Đôi khi ta không ra ngoài
Chỉ để nhìn mặt nhau, ta nhìn đâu? Ta nhìn phone, pose, selfie
Rồi đấy
Đôi khi ta không mua vài
Ly cà phê tán dóc rồi về đâu? Về lòng nhau trong lâu dài
Mình sẽ xuống phố rộn ràng, ngồi ăn bánh xong uống trà
Dẹp hết mấy thứ mệt nhoài làm u ám bao ngày qua
Đừng cứ kiếm cớ đòi về, cuộc vui vẫn chưa xong mà
Mình còn tăng hai
Và còn tăng ba
Đừng về trước nha
Người ơi, người ở í a đừng về
Làm sao, làm sao để vui một khi vắng đi một người
Người ơi, người ở í a đừng về
Lâu lâu mới vui như vậy, bao lâu mới gặp lại đây?
Người ở đừng về
Người ơi, người ở í a đừng về
Làm sao, làm sao để vui một khi vắng đi một người
Người ơi, người ở í a đừng về
Lâu lâu mới vui như vậy, bao lâu mới gặp lại đây?
Người ở tôi về')
INSERT [dbo].[Metadata] ([trackname], [track_id], [explicit], [danceability], [energy], [key], [loudness], [mode], [speechiness], [acousticness], [instrumentalness], [liveness], [valence], [tempo], [duration_ms], [time_signature], [year], [release_date], [createdAt], [updatedAt], [lyrics]) VALUES (N'Chàng Kỵ Sĩ Và Ánh Sao', 1029, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 216058, 4, 2025, CAST(N'2025-05-18T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-05-18T15:10:53.3630000+00:00' AS DateTimeOffset), CAST(N'2025-05-18T15:10:53.3630000+00:00' AS DateTimeOffset), N'Đêm sáng trăng

Anh là bóng đêm đi lạc

Mang vết thương

Chàng kỵ sĩ tha phương

Qua cánh rừng

Bao mùa lá đã rơi vàng

Người trầm tư,

ngân nga khúc ca buồn

**

Em - ánh sao

trên trời phía bắc địa cầu

Đã ngắm nhìn

nghìn năm lá thu rơi

Em xuyến xao

Trong màu mắt anh xa vời

Chỉ thầm mong,

sáng soi lối đi người

**

Nhìn về em, nhìn về em

Dù trong khoảnh khắc đây thôi

Nhìn thật sâu vào đôi mắt

Dù người chẳng cần đáp lời

Một giây trôi qua là mãi mãi

Chỉ cần ta nhớ nhau trong đời

Mỗi khi lạc đường,

hãy nhìn lên ánh sao

Anh hỡi!

**

Chàng kỵ sĩ xuyên màn đêm

Đi lạc vào trong giấc mộng

Người đừng mang theo nỗi buồn

Em còn đây hoài vấn vương.

Dù cho ta cách xa nhau

Qua hàng vạn năm ánh sáng.

Chẳng cần tiếng yêu thành câu

Chỉ cần thấy nhau trong đời.

**

Một giây thôi, một giây thôi

Hòa trong vũ khúc đôi ta

Nhìn thật sâu vào đôi mắt này

Chẳng thể nào thoát ra

Tựa như phép màu cổ tích

Một không gian chỉ có hai người

Biết sao quên một nụ hôn đã đánh rơi.

Anh hỡi!!!

**

Chàng kỵ sĩ xuyên màn đêm

Đi lạc vào trong giấc mộng

Người đừng mang theo nỗi buồn

Em còn đây hoài vấn vương.

Dù cho ta cách xa nhau

Qua hàng vạn năm ánh sáng.

Chẳng cần tiếng yêu thành câu

Chỉ cần thấy nhau trong đời.

**

Chàng kỵ sĩ em thầm thương

Đã mệt nhoài nơi chiến trường

Nhìn người mang bao vết thương

Trong hừng đông nhòa ánh dương

Chàng kỵ sĩ nhớ nơi xưa

Nhưng chẳng trở về được nữa

Còn đây khúc ca dở dang

Bên một ánh sao đã tàn.')
INSERT [dbo].[Metadata] ([trackname], [track_id], [explicit], [danceability], [energy], [key], [loudness], [mode], [speechiness], [acousticness], [instrumentalness], [liveness], [valence], [tempo], [duration_ms], [time_signature], [year], [release_date], [createdAt], [updatedAt], [lyrics]) VALUES (N'Đừng làm chái trim anh đau', 1054, 1, 0.60299999999999965, 0.19118, 11, 6799.71875, 1, 0.068609299999999956, 0.25035560219999975, 0.15964111020000021, 0.23480519999999971, 0.60842283333333347, 125.57, 325695, NULL, NULL, NULL, CAST(N'2025-05-23T02:45:25.3060000+00:00' AS DateTimeOffset), CAST(N'2025-05-23T02:45:25.3060000+00:00' AS DateTimeOffset), N'')
INSERT [dbo].[Metadata] ([trackname], [track_id], [explicit], [danceability], [energy], [key], [loudness], [mode], [speechiness], [acousticness], [instrumentalness], [liveness], [valence], [tempo], [duration_ms], [time_signature], [year], [release_date], [createdAt], [updatedAt], [lyrics]) VALUES (N'ĐLTTAĐ', 1055, 1, 0.60299999999999965, 0.19118, 11, 6799.71875, 1, 0.068609299999999956, 0.25035560219999975, 0.15964111020000021, 0.23480519999999971, 0.60842283333333347, 125.57, 325695, NULL, NULL, NULL, CAST(N'2025-05-23T02:57:03.4050000+00:00' AS DateTimeOffset), CAST(N'2025-05-23T02:57:03.4050000+00:00' AS DateTimeOffset), N'')
INSERT [dbo].[Metadata] ([trackname], [track_id], [explicit], [danceability], [energy], [key], [loudness], [mode], [speechiness], [acousticness], [instrumentalness], [liveness], [valence], [tempo], [duration_ms], [time_signature], [year], [release_date], [createdAt], [updatedAt], [lyrics]) VALUES (N'ABC', 1056, 0.07, 0.60299999999999965, 0.19118, 11, 6799.71875, 1, 0.068609299999999956, 0.25035560219999975, 0.15964111020000021, 0.23480519999999971, 0.60842283333333347, 125.57, 325695, NULL, NULL, NULL, CAST(N'2025-05-23T03:22:36.3640000+00:00' AS DateTimeOffset), CAST(N'2025-05-23T03:22:36.3640000+00:00' AS DateTimeOffset), N'')
INSERT [dbo].[Metadata] ([trackname], [track_id], [explicit], [danceability], [energy], [key], [loudness], [mode], [speechiness], [acousticness], [instrumentalness], [liveness], [valence], [tempo], [duration_ms], [time_signature], [year], [release_date], [createdAt], [updatedAt], [lyrics]) VALUES (N'TestBanQuyen', 1057, 0.084, 0.63958599999999988, 0.189868, 11, 6104.672852, 1, 0.0642102, 0.29513612466666655, 0.050520935046666715, 0.22318400000000022, 0.70185580000000114, 125.5, 281123, NULL, NULL, NULL, CAST(N'2025-05-23T05:37:10.9510000+00:00' AS DateTimeOffset), CAST(N'2025-05-23T05:37:10.9510000+00:00' AS DateTimeOffset), N'')
INSERT [dbo].[Metadata] ([trackname], [track_id], [explicit], [danceability], [energy], [key], [loudness], [mode], [speechiness], [acousticness], [instrumentalness], [liveness], [valence], [tempo], [duration_ms], [time_signature], [year], [release_date], [createdAt], [updatedAt], [lyrics]) VALUES (N'GG', 1058, 0.116, 0.60309999999999986, 0.198941, 11, 6469.007324, 1, 0.088394800000000051, 0.2567648198, 0.0010892850559999986, 0.25797853333333337, 0.65719600000000034, 125.52, 279210, NULL, NULL, NULL, CAST(N'2025-05-23T05:47:01.2670000+00:00' AS DateTimeOffset), CAST(N'2025-05-23T05:47:01.2670000+00:00' AS DateTimeOffset), N'')
INSERT [dbo].[Metadata] ([trackname], [track_id], [explicit], [danceability], [energy], [key], [loudness], [mode], [speechiness], [acousticness], [instrumentalness], [liveness], [valence], [tempo], [duration_ms], [time_signature], [year], [release_date], [createdAt], [updatedAt], [lyrics]) VALUES (N'Cười Haha', 1059, 0.308, 0.4839480000000001, 0.114177, 0, 313.312042, 1, 0.2728388, 0.36796421180000005, 0.30401935129999991, 0.43220680000000089, 0.54013320000000031, 152.08, 9241, NULL, NULL, NULL, CAST(N'2025-05-23T06:38:36.4830000+00:00' AS DateTimeOffset), CAST(N'2025-05-23T06:38:36.4830000+00:00' AS DateTimeOffset), N'')
GO
SET IDENTITY_INSERT [dbo].[Playlists] ON 

INSERT [dbo].[Playlists] ([id], [userId], [title], [createDate], [imageUrl], [createdAt], [updatedAt], [privacy]) VALUES (-10001, 1, N'Thủ công ID', CAST(N'2025-05-21T20:35:47.2733333+00:00' AS DateTimeOffset), NULL, CAST(N'2025-05-21T20:35:47.2733333+00:00' AS DateTimeOffset), CAST(N'2025-05-21T20:35:47.2733333+00:00' AS DateTimeOffset), N'public')
INSERT [dbo].[Playlists] ([id], [userId], [title], [createDate], [imageUrl], [createdAt], [updatedAt], [privacy]) VALUES (-10000, 1, N'Thủ công ID', CAST(N'2025-05-21T20:31:17.1900000+00:00' AS DateTimeOffset), NULL, CAST(N'2025-05-21T20:31:17.1900000+00:00' AS DateTimeOffset), CAST(N'2025-05-21T20:31:17.1900000+00:00' AS DateTimeOffset), N'public')
INSERT [dbo].[Playlists] ([id], [userId], [title], [createDate], [imageUrl], [createdAt], [updatedAt], [privacy]) VALUES (1, 1007, N'Danh sách phát của tôi #1', CAST(N'2025-04-16T05:26:45.6960000+00:00' AS DateTimeOffset), N'/assets/playlist_image/playlist-cover-1747322764177-584458997.png', CAST(N'2025-04-16T05:26:45.6970000+00:00' AS DateTimeOffset), CAST(N'2025-05-15T15:26:04.2280000+00:00' AS DateTimeOffset), N'private')
INSERT [dbo].[Playlists] ([id], [userId], [title], [createDate], [imageUrl], [createdAt], [updatedAt], [privacy]) VALUES (1006, 1007, N'Danh sách phát của tôi #2', CAST(N'2025-04-29T00:42:57.5490000+00:00' AS DateTimeOffset), N'/assets/playlist_image/playlist-cover-1746517691637-744719418.jpg', CAST(N'2025-04-29T00:42:57.5490000+00:00' AS DateTimeOffset), CAST(N'2025-05-06T07:48:11.6820000+00:00' AS DateTimeOffset), N'public')
INSERT [dbo].[Playlists] ([id], [userId], [title], [createDate], [imageUrl], [createdAt], [updatedAt], [privacy]) VALUES (1007, 1007, N'Phạm Tuấn Hưng', CAST(N'2025-04-29T01:03:50.5150000+00:00' AS DateTimeOffset), N'/assets/playlist_image/playlist-cover-1746463042956-713940815.png', CAST(N'2025-04-29T01:03:50.5160000+00:00' AS DateTimeOffset), CAST(N'2025-05-05T16:37:22.9840000+00:00' AS DateTimeOffset), N'public')
INSERT [dbo].[Playlists] ([id], [userId], [title], [createDate], [imageUrl], [createdAt], [updatedAt], [privacy]) VALUES (1008, 1007, N'8', CAST(N'2025-05-02T03:53:29.9670000+00:00' AS DateTimeOffset), N'/assets/playlist_image/playlist-cover-1746463127223-384873145.jpg', CAST(N'2025-05-02T03:53:29.9680000+00:00' AS DateTimeOffset), CAST(N'2025-05-05T16:38:47.2400000+00:00' AS DateTimeOffset), N'public')
INSERT [dbo].[Playlists] ([id], [userId], [title], [createDate], [imageUrl], [createdAt], [updatedAt], [privacy]) VALUES (1023, 1007, N'Danh sách phát của tôi #9cddfddsds', CAST(N'2025-05-05T16:20:22.3200000+00:00' AS DateTimeOffset), N'/assets/playlist_image/playlist-cover-1747672868072-26636283.png', CAST(N'2025-05-05T16:20:22.3210000+00:00' AS DateTimeOffset), CAST(N'2025-05-19T16:41:08.1540000+00:00' AS DateTimeOffset), N'public')
INSERT [dbo].[Playlists] ([id], [userId], [title], [createDate], [imageUrl], [createdAt], [updatedAt], [privacy]) VALUES (1034, 1007, N'Danh sách phát của tôi #6', CAST(N'2025-05-05T17:15:56.4500000+00:00' AS DateTimeOffset), N'/assets/playlist_image/playlist-cover-1746465285260-890299669.jpg', CAST(N'2025-05-05T17:15:56.4500000+00:00' AS DateTimeOffset), CAST(N'2025-05-05T17:16:02.6550000+00:00' AS DateTimeOffset), N'public')
INSERT [dbo].[Playlists] ([id], [userId], [title], [createDate], [imageUrl], [createdAt], [updatedAt], [privacy]) VALUES (1049, 1009, N'Danh sách phát của tôi #1', CAST(N'2025-05-20T10:44:53.2470000+00:00' AS DateTimeOffset), N'/assets/playlist_image/playlist-cover-1747753180399-93755722.jpg', CAST(N'2025-05-20T10:44:53.2550000+00:00' AS DateTimeOffset), CAST(N'2025-05-20T14:59:40.4850000+00:00' AS DateTimeOffset), N'public')
INSERT [dbo].[Playlists] ([id], [userId], [title], [createDate], [imageUrl], [createdAt], [updatedAt], [privacy]) VALUES (10000, 1, N'Thủ công ID', CAST(N'2025-05-21T20:12:18.5233333+00:00' AS DateTimeOffset), NULL, CAST(N'2025-05-21T20:12:18.5233333+00:00' AS DateTimeOffset), CAST(N'2025-05-21T20:12:18.5233333+00:00' AS DateTimeOffset), N'public')
INSERT [dbo].[Playlists] ([id], [userId], [title], [createDate], [imageUrl], [createdAt], [updatedAt], [privacy]) VALUES (10002, 1, N'Playlist tạo bằng Sequelize', CAST(N'2025-05-21T13:43:05.5680000+00:00' AS DateTimeOffset), NULL, CAST(N'2025-05-21T13:43:05.5680000+00:00' AS DateTimeOffset), CAST(N'2025-05-21T13:43:05.5700000+00:00' AS DateTimeOffset), N'public')
INSERT [dbo].[Playlists] ([id], [userId], [title], [createDate], [imageUrl], [createdAt], [updatedAt], [privacy]) VALUES (10003, 1, N'Playlist tạo bằng Sequelize lần cuối', CAST(N'2025-05-21T13:46:24.0040000+00:00' AS DateTimeOffset), NULL, CAST(N'2025-05-21T13:46:24.0040000+00:00' AS DateTimeOffset), CAST(N'2025-05-21T13:46:24.0050000+00:00' AS DateTimeOffset), N'public')
INSERT [dbo].[Playlists] ([id], [userId], [title], [createDate], [imageUrl], [createdAt], [updatedAt], [privacy]) VALUES (10007, 1, N'Playlist tạo bằng Sequelize lần cuối', CAST(N'2025-05-21T13:49:32.0690000+00:00' AS DateTimeOffset), NULL, CAST(N'2025-05-21T13:49:32.0690000+00:00' AS DateTimeOffset), CAST(N'2025-05-21T13:49:32.0710000+00:00' AS DateTimeOffset), N'public')
SET IDENTITY_INSERT [dbo].[Playlists] OFF
GO
INSERT [dbo].[PlaylistTracks] ([playlistId], [trackId], [createdAt], [updatedAt]) VALUES (1, 2, CAST(N'2025-04-16T06:18:13.6750000+00:00' AS DateTimeOffset), CAST(N'2025-04-16T06:18:13.6750000+00:00' AS DateTimeOffset))
INSERT [dbo].[PlaylistTracks] ([playlistId], [trackId], [createdAt], [updatedAt]) VALUES (1, 1002, CAST(N'2025-05-02T04:01:18.7880000+00:00' AS DateTimeOffset), CAST(N'2025-05-02T04:01:18.7880000+00:00' AS DateTimeOffset))
INSERT [dbo].[PlaylistTracks] ([playlistId], [trackId], [createdAt], [updatedAt]) VALUES (1, 1003, CAST(N'2025-05-02T04:02:48.0930000+00:00' AS DateTimeOffset), CAST(N'2025-05-02T04:02:48.0930000+00:00' AS DateTimeOffset))
INSERT [dbo].[PlaylistTracks] ([playlistId], [trackId], [createdAt], [updatedAt]) VALUES (1, 1023, CAST(N'2025-05-16T03:23:59.2120000+00:00' AS DateTimeOffset), CAST(N'2025-05-16T03:23:59.2120000+00:00' AS DateTimeOffset))
INSERT [dbo].[PlaylistTracks] ([playlistId], [trackId], [createdAt], [updatedAt]) VALUES (1, 1029, CAST(N'2025-05-19T09:55:01.3920000+00:00' AS DateTimeOffset), CAST(N'2025-05-19T09:55:01.3920000+00:00' AS DateTimeOffset))
INSERT [dbo].[PlaylistTracks] ([playlistId], [trackId], [createdAt], [updatedAt]) VALUES (1006, 1003, CAST(N'2025-04-29T00:47:39.7680000+00:00' AS DateTimeOffset), CAST(N'2025-04-29T00:47:39.7680000+00:00' AS DateTimeOffset))
INSERT [dbo].[PlaylistTracks] ([playlistId], [trackId], [createdAt], [updatedAt]) VALUES (1006, 1029, CAST(N'2025-05-21T10:34:38.5880000+00:00' AS DateTimeOffset), CAST(N'2025-05-21T10:34:38.5880000+00:00' AS DateTimeOffset))
INSERT [dbo].[PlaylistTracks] ([playlistId], [trackId], [createdAt], [updatedAt]) VALUES (1007, 1004, CAST(N'2025-05-02T03:46:16.6550000+00:00' AS DateTimeOffset), CAST(N'2025-05-02T03:46:16.6550000+00:00' AS DateTimeOffset))
INSERT [dbo].[PlaylistTracks] ([playlistId], [trackId], [createdAt], [updatedAt]) VALUES (1007, 1006, CAST(N'2025-05-19T15:46:45.6380000+00:00' AS DateTimeOffset), CAST(N'2025-05-19T15:46:45.6380000+00:00' AS DateTimeOffset))
INSERT [dbo].[PlaylistTracks] ([playlistId], [trackId], [createdAt], [updatedAt]) VALUES (1007, 1007, CAST(N'2025-05-19T15:46:39.1440000+00:00' AS DateTimeOffset), CAST(N'2025-05-19T15:46:39.1440000+00:00' AS DateTimeOffset))
INSERT [dbo].[PlaylistTracks] ([playlistId], [trackId], [createdAt], [updatedAt]) VALUES (1007, 1008, CAST(N'2025-05-19T15:46:21.4120000+00:00' AS DateTimeOffset), CAST(N'2025-05-19T15:46:21.4120000+00:00' AS DateTimeOffset))
INSERT [dbo].[PlaylistTracks] ([playlistId], [trackId], [createdAt], [updatedAt]) VALUES (1008, 1005, CAST(N'2025-05-02T03:55:39.1670000+00:00' AS DateTimeOffset), CAST(N'2025-05-02T03:55:39.1670000+00:00' AS DateTimeOffset))
INSERT [dbo].[PlaylistTracks] ([playlistId], [trackId], [createdAt], [updatedAt]) VALUES (1008, 1007, CAST(N'2025-05-19T15:46:12.0560000+00:00' AS DateTimeOffset), CAST(N'2025-05-19T15:46:12.0560000+00:00' AS DateTimeOffset))
INSERT [dbo].[PlaylistTracks] ([playlistId], [trackId], [createdAt], [updatedAt]) VALUES (1023, 1003, CAST(N'2025-05-05T17:15:12.2960000+00:00' AS DateTimeOffset), CAST(N'2025-05-05T17:15:12.2960000+00:00' AS DateTimeOffset))
INSERT [dbo].[PlaylistTracks] ([playlistId], [trackId], [createdAt], [updatedAt]) VALUES (1023, 1004, CAST(N'2025-05-05T17:15:30.6300000+00:00' AS DateTimeOffset), CAST(N'2025-05-05T17:15:30.6300000+00:00' AS DateTimeOffset))
INSERT [dbo].[PlaylistTracks] ([playlistId], [trackId], [createdAt], [updatedAt]) VALUES (1049, 1005, CAST(N'2025-05-20T14:57:48.3090000+00:00' AS DateTimeOffset), CAST(N'2025-05-20T14:57:48.3090000+00:00' AS DateTimeOffset))
INSERT [dbo].[PlaylistTracks] ([playlistId], [trackId], [createdAt], [updatedAt]) VALUES (1049, 1022, CAST(N'2025-05-20T10:44:55.7030000+00:00' AS DateTimeOffset), CAST(N'2025-05-20T10:44:55.7030000+00:00' AS DateTimeOffset))
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([id], [roleName], [createdAt], [updatedAt]) VALUES (1, N'user', CAST(N'2025-04-16T04:14:18.9300000+00:00' AS DateTimeOffset), CAST(N'2025-04-16T04:14:18.9300000+00:00' AS DateTimeOffset))
INSERT [dbo].[Roles] ([id], [roleName], [createdAt], [updatedAt]) VALUES (2, N'admin', CAST(N'2025-04-16T04:14:18.9300000+00:00' AS DateTimeOffset), CAST(N'2025-04-16T04:14:18.9300000+00:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250414015508-create-track.js')
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250414072227-create-role.js')
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250414072236-create-playlist.js')
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250414072241-create-like.js')
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250414072247-create-listening-history.js')
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250414072256-create-search-history.js')
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250415083520-create-user.js')
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250415153910-create-metadata.js')
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250416022614-create-user.js')
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250416022908-create-user.js')
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250416042225-create-playlist.js')
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250416055634-create-playlist-track.js')
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250507020627-add-lyrics-to-metadata.js')
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250512144436-add-status-to-tracks.js')
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250515072013-add-profile-fields-to-user.js')
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250518133810-add-mode-to-tracks.js')
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250518141100-rename-mode-to-visibility-in-tracks.js')
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250518141605-rename-mode-to-privacy-in-tracks.js')
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250519104008-add-privacy-to-playlists.js')
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250523031205-change-explicit-to-float.cjs')
GO
SET IDENTITY_INSERT [dbo].[Tracks] ON 

INSERT [dbo].[Tracks] ([id], [trackUrl], [imageUrl], [uploaderId], [createdAt], [updatedAt], [status], [privacy]) VALUES (2, N'/assets/track_audio/BacPhan.mp3', N'/assets/track_image/blue.png', 1007, CAST(N'2025-04-16T06:31:34.1090000+00:00' AS DateTimeOffset), CAST(N'2025-05-18T18:05:39.0880000+00:00' AS DateTimeOffset), N'approved', N'private')
INSERT [dbo].[Tracks] ([id], [trackUrl], [imageUrl], [uploaderId], [createdAt], [updatedAt], [status], [privacy]) VALUES (1002, N'/assets/track_audio/Bánh Mì Không.mp3', N'/assets/track_image/banhmikhong.jpg', 1007, CAST(N'2025-04-20T08:15:21.0000000+00:00' AS DateTimeOffset), CAST(N'2025-04-20T08:15:21.0000000+00:00' AS DateTimeOffset), N'approved', N'public')
INSERT [dbo].[Tracks] ([id], [trackUrl], [imageUrl], [uploaderId], [createdAt], [updatedAt], [status], [privacy]) VALUES (1003, N'/assets/track_audio/QuaLau.mp3', N'/assets/track_image/qualau.jpg', 1007, CAST(N'2025-04-20T08:16:30.0000000+00:00' AS DateTimeOffset), CAST(N'2025-04-20T08:16:30.0000000+00:00' AS DateTimeOffset), N'approved', N'public')
INSERT [dbo].[Tracks] ([id], [trackUrl], [imageUrl], [uploaderId], [createdAt], [updatedAt], [status], [privacy]) VALUES (1004, N'/assets/track_audio/SongGio.mp3', N'/assets/track_image/anhmau.png', 1, CAST(N'2025-04-21T09:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-04-21T09:00:00.0000000+00:00' AS DateTimeOffset), N'approved', N'public')
INSERT [dbo].[Tracks] ([id], [trackUrl], [imageUrl], [uploaderId], [createdAt], [updatedAt], [status], [privacy]) VALUES (1005, N'/assets/track_audio/ManhBa.mp3', N'/assets/track_image/anhmau.png', 1, CAST(N'2025-04-21T09:10:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-04-21T09:10:00.0000000+00:00' AS DateTimeOffset), N'approved', N'public')
INSERT [dbo].[Tracks] ([id], [trackUrl], [imageUrl], [uploaderId], [createdAt], [updatedAt], [status], [privacy]) VALUES (1006, N'/assets/track_audio/HonCaMayTroi.mp3', N'/assets/track_image/anhmau.png', 1, CAST(N'2025-04-22T10:20:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-04-22T10:20:00.0000000+00:00' AS DateTimeOffset), N'approved', N'public')
INSERT [dbo].[Tracks] ([id], [trackUrl], [imageUrl], [uploaderId], [createdAt], [updatedAt], [status], [privacy]) VALUES (1007, N'/assets/track_audio/CaoOc20.mp3', N'/assets/track_image/anhmau.png', 1, CAST(N'2025-04-22T10:25:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-04-22T10:25:00.0000000+00:00' AS DateTimeOffset), N'approved', N'public')
INSERT [dbo].[Tracks] ([id], [trackUrl], [imageUrl], [uploaderId], [createdAt], [updatedAt], [status], [privacy]) VALUES (1008, N'/assets/track_audio/ChamKheTimAnh.mp3', N'/assets/track_image/anhmau.png', 1, CAST(N'2025-04-23T11:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-04-23T11:00:00.0000000+00:00' AS DateTimeOffset), N'approved', N'public')
INSERT [dbo].[Tracks] ([id], [trackUrl], [imageUrl], [uploaderId], [createdAt], [updatedAt], [status], [privacy]) VALUES (1009, N'/assets/track_audio/EmGiOi.mp3', N'/assets/track_image/anhmau.png', 1007, CAST(N'2025-04-23T11:05:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-04-23T11:05:00.0000000+00:00' AS DateTimeOffset), N'approved', N'public')
INSERT [dbo].[Tracks] ([id], [trackUrl], [imageUrl], [uploaderId], [createdAt], [updatedAt], [status], [privacy]) VALUES (1010, N'/assets/track_audio/CoDangDeYeuThuong.mp3', N'/assets/track_image/image-1747322743748-984174800.png', 1007, CAST(N'2025-04-16T05:41:12.0930000+00:00' AS DateTimeOffset), CAST(N'2025-05-15T15:25:43.7630000+00:00' AS DateTimeOffset), N'approved', N'public')
INSERT [dbo].[Tracks] ([id], [trackUrl], [imageUrl], [uploaderId], [createdAt], [updatedAt], [status], [privacy]) VALUES (1021, N'assets/track_audio/1747158315159-track.mp3', N'assets/track_image/1747158315295-track.jpg', 1007, CAST(N'2025-05-13T17:45:15.3610000+00:00' AS DateTimeOffset), CAST(N'2025-05-13T17:45:15.3610000+00:00' AS DateTimeOffset), N'approved', N'public')
INSERT [dbo].[Tracks] ([id], [trackUrl], [imageUrl], [uploaderId], [createdAt], [updatedAt], [status], [privacy]) VALUES (1022, N'/assets/track_audio/audio-1747237483977-866411088.mp3', N'/assets/track_image/image-1747237483974-356318936.jpg', 1007, CAST(N'2025-05-14T10:14:50.4530000+00:00' AS DateTimeOffset), CAST(N'2025-05-14T15:44:44.1120000+00:00' AS DateTimeOffset), N'approved', N'public')
INSERT [dbo].[Tracks] ([id], [trackUrl], [imageUrl], [uploaderId], [createdAt], [updatedAt], [status], [privacy]) VALUES (1023, N'assets/track_audio/audio-1747237664996-732068687.mp3', N'/assets/track_image/track-cover-1747591471032-843955241.png', 1007, CAST(N'2025-05-14T15:47:45.1550000+00:00' AS DateTimeOffset), CAST(N'2025-05-18T18:04:31.0680000+00:00' AS DateTimeOffset), N'approved', N'private')
INSERT [dbo].[Tracks] ([id], [trackUrl], [imageUrl], [uploaderId], [createdAt], [updatedAt], [status], [privacy]) VALUES (1028, N'assets/track_audio/audio-1747580721244-74046779.mp3', N'assets/track_image/image-1747580721361-302334652.jpg', 1007, CAST(N'2025-05-18T15:05:21.3910000+00:00' AS DateTimeOffset), CAST(N'2025-05-18T15:05:21.3910000+00:00' AS DateTimeOffset), N'approved', N'private')
INSERT [dbo].[Tracks] ([id], [trackUrl], [imageUrl], [uploaderId], [createdAt], [updatedAt], [status], [privacy]) VALUES (1029, N'assets/track_audio/audio-1747581053096-787515233.mp3', N'assets/track_image/image-1747581053262-866955918.jpg', 1007, CAST(N'2025-05-18T15:10:53.3170000+00:00' AS DateTimeOffset), CAST(N'2025-05-18T15:10:53.3170000+00:00' AS DateTimeOffset), N'approved', N'private')
INSERT [dbo].[Tracks] ([id], [trackUrl], [imageUrl], [uploaderId], [createdAt], [updatedAt], [status], [privacy]) VALUES (1054, N'assets/track_audio/audio-1747968162367-184497414.mp3', N'assets/track_image/image-1747968162383-65117803.jpg', 1007, CAST(N'2025-05-23T02:45:25.2980000+00:00' AS DateTimeOffset), CAST(N'2025-05-23T02:45:25.2980000+00:00' AS DateTimeOffset), N'approved', N'public')
INSERT [dbo].[Tracks] ([id], [trackUrl], [imageUrl], [uploaderId], [createdAt], [updatedAt], [status], [privacy]) VALUES (1055, N'assets/track_audio/audio-1747968843101-862289649.mp3', N'assets/track_image/image-1747968843156-163419205.jpg', 1007, CAST(N'2025-05-23T02:57:03.3970000+00:00' AS DateTimeOffset), CAST(N'2025-05-23T02:57:03.3970000+00:00' AS DateTimeOffset), N'approved', N'public')
INSERT [dbo].[Tracks] ([id], [trackUrl], [imageUrl], [uploaderId], [createdAt], [updatedAt], [status], [privacy]) VALUES (1056, N'assets/track_audio/audio-1747970382291-367687609.mp3', N'assets/track_image/image-1747970382338-794541044.jpg', 1007, CAST(N'2025-05-23T03:22:36.3590000+00:00' AS DateTimeOffset), CAST(N'2025-05-23T03:22:36.3590000+00:00' AS DateTimeOffset), N'approved', N'public')
INSERT [dbo].[Tracks] ([id], [trackUrl], [imageUrl], [uploaderId], [createdAt], [updatedAt], [status], [privacy]) VALUES (1057, N'assets/track_audio/audio-1747978490096-973053464.mp3', N'assets/track_image/image-1747978490105-290892008.jpg', 1007, CAST(N'2025-05-23T05:37:10.9270000+00:00' AS DateTimeOffset), CAST(N'2025-05-23T05:37:10.9270000+00:00' AS DateTimeOffset), N'approved', N'public')
INSERT [dbo].[Tracks] ([id], [trackUrl], [imageUrl], [uploaderId], [createdAt], [updatedAt], [status], [privacy]) VALUES (1058, N'assets/track_audio/audio-1747979080197-366353012.mp3', N'assets/track_image/image-1747979080243-700209439.jpg', 1007, CAST(N'2025-05-23T05:47:01.2560000+00:00' AS DateTimeOffset), CAST(N'2025-05-23T05:47:01.2560000+00:00' AS DateTimeOffset), N'approved', N'public')
INSERT [dbo].[Tracks] ([id], [trackUrl], [imageUrl], [uploaderId], [createdAt], [updatedAt], [status], [privacy]) VALUES (1059, N'assets/track_audio/audio-1747982295932-775865894.mp3', N'assets/track_image/image-1747982295933-284825065.jpg', 1007, CAST(N'2025-05-23T06:38:36.4760000+00:00' AS DateTimeOffset), CAST(N'2025-05-23T06:38:36.4760000+00:00' AS DateTimeOffset), N'approved', N'public')
SET IDENTITY_INSERT [dbo].[Tracks] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [userName], [email], [password], [roleId], [createdAt], [updatedAt], [Name], [Birthday], [Address], [PhoneNumber], [Avatar]) VALUES (1, N'updated', N'khai@gmail.com', N'$2b$10$SoEuTmzy2.M5F2hNNCCoEeWSB0XvTKKjs/JUqJ66.7h0TvKD0b.8e', 1, CAST(N'2025-04-16T02:09:14.8970000+00:00' AS DateTimeOffset), CAST(N'2025-04-16T04:14:29.5390000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([id], [userName], [email], [password], [roleId], [createdAt], [updatedAt], [Name], [Birthday], [Address], [PhoneNumber], [Avatar]) VALUES (2, N'ab', N'ab@gmail.com', N'$2b$10$Wlr7jvUQvaT8HoY0kRip/O0bObbw0egnPRyR97GLS48wA3rRnsjwm', NULL, CAST(N'2025-04-16T02:31:55.9580000+00:00' AS DateTimeOffset), CAST(N'2025-04-16T02:31:55.9580000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([id], [userName], [email], [password], [roleId], [createdAt], [updatedAt], [Name], [Birthday], [Address], [PhoneNumber], [Avatar]) VALUES (5, N'abc', N'abc@gmail.com', N'$2b$10$PGmKBJn0Ps.LjA0odcxjA./63DgNteY7gXyjKmJp2VsDBqCt68GPi', NULL, CAST(N'2025-04-16T02:33:39.4070000+00:00' AS DateTimeOffset), CAST(N'2025-04-16T02:33:39.4070000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([id], [userName], [email], [password], [roleId], [createdAt], [updatedAt], [Name], [Birthday], [Address], [PhoneNumber], [Avatar]) VALUES (6, N'abcd', N'abcd@gmail.com', N'$2b$10$sckBT.tcZqitpZx6y75uyu/rDMjE9Iq.u5PbnkWtxCfGmCYw7LRri', 1, CAST(N'2025-04-16T04:14:41.1600000+00:00' AS DateTimeOffset), CAST(N'2025-04-16T04:14:41.1600000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([id], [userName], [email], [password], [roleId], [createdAt], [updatedAt], [Name], [Birthday], [Address], [PhoneNumber], [Avatar]) VALUES (7, N'updatedaaa', N'khaiaaa@gmail.com', N'$2b$10$lXY2/yvlgvFcHDS3cwnf8OeJngIFJCzMppn5RRVmg7l25hq9Bs3b.', 1, CAST(N'2025-04-16T05:41:12.1040000+00:00' AS DateTimeOffset), CAST(N'2025-04-16T06:32:20.1940000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([id], [userName], [email], [password], [roleId], [createdAt], [updatedAt], [Name], [Birthday], [Address], [PhoneNumber], [Avatar]) VALUES (8, N'Nguyen Van A', N'a@gmail.com', N'123456', NULL, CAST(N'2025-04-16T06:31:34.1240000+00:00' AS DateTimeOffset), CAST(N'2025-04-16T06:31:34.1240000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([id], [userName], [email], [password], [roleId], [createdAt], [updatedAt], [Name], [Birthday], [Address], [PhoneNumber], [Avatar]) VALUES (1007, N'hungphamtuan', N'abcabc@gmail.com', N'$2b$10$laRucTW2TJFMq9lFTBd6Ou8POWo7JAGlW.h1wKxz.w7ZDvliPOSVS', 1, CAST(N'2025-04-24T08:51:21.6580000+00:00' AS DateTimeOffset), CAST(N'2025-05-18T17:36:58.6060000+00:00' AS DateTimeOffset), N'Phạm Tuấn Hưng', CAST(N'2025-05-15' AS Date), N'123 Đường ABC, Quận 1', N'0123456789', N'/assets/user_image/user-avatar-1747400787145-321471346.png')
INSERT [dbo].[Users] ([id], [userName], [email], [password], [roleId], [createdAt], [updatedAt], [Name], [Birthday], [Address], [PhoneNumber], [Avatar]) VALUES (1008, N'hungpham', N'hungpham@gmail.com', N'$2b$10$tjoosW3Mh5ZKJNr6H4aCJeusdJXhEJ4ZB8JGpKbfNzyPbV1py9ori', 1, CAST(N'2025-05-02T04:39:29.9160000+00:00' AS DateTimeOffset), CAST(N'2025-05-02T04:39:29.9160000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([id], [userName], [email], [password], [roleId], [createdAt], [updatedAt], [Name], [Birthday], [Address], [PhoneNumber], [Avatar]) VALUES (1009, N'abcabc', N'ABCDEF@gmail.com', N'$2b$10$u1uesknyi5v5lhy6YyououE1idYcBtl6pc4tCY/B53ZcqRzKVBQlS', 1, CAST(N'2025-05-16T13:18:32.8520000+00:00' AS DateTimeOffset), CAST(N'2025-05-20T11:15:35.9870000+00:00' AS DateTimeOffset), N'Unknown', NULL, NULL, NULL, N'/assets/user_image/user-avatar-1747739735977-633801430.jpg')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Sequeliz__72E12F1BBC4E6358]    Script Date: 5/28/2025 1:45:39 AM ******/
ALTER TABLE [dbo].[SequelizeMeta] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Playlists] ADD  DEFAULT (N'public') FOR [privacy]
GO
ALTER TABLE [dbo].[Tracks] ADD  DEFAULT (N'pending') FOR [status]
GO
ALTER TABLE [dbo].[Tracks] ADD  DEFAULT (N'public') FOR [privacy]
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD FOREIGN KEY([trackId])
REFERENCES [dbo].[Tracks] ([id])
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[listeningHistories]  WITH CHECK ADD FOREIGN KEY([trackId])
REFERENCES [dbo].[Tracks] ([id])
GO
ALTER TABLE [dbo].[listeningHistories]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Metadata]  WITH CHECK ADD FOREIGN KEY([track_id])
REFERENCES [dbo].[Tracks] ([id])
GO
ALTER TABLE [dbo].[Playlists]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[PlaylistTracks]  WITH CHECK ADD FOREIGN KEY([playlistId])
REFERENCES [dbo].[Playlists] ([id])
GO
ALTER TABLE [dbo].[PlaylistTracks]  WITH CHECK ADD FOREIGN KEY([trackId])
REFERENCES [dbo].[Tracks] ([id])
GO
ALTER TABLE [dbo].[searchHistories]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Tracks]  WITH CHECK ADD FOREIGN KEY([uploaderId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[Tracks]  WITH CHECK ADD  CONSTRAINT [chk_track_status] CHECK  (([status]='rejected' OR [status]='approved' OR [status]='pending'))
GO
ALTER TABLE [dbo].[Tracks] CHECK CONSTRAINT [chk_track_status]
GO
USE [master]
GO
ALTER DATABASE [DB_Graptify] SET  READ_WRITE 
GO
