import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import { getPlaylists } from "../../components/Manager_Playlists/ManagerDataPlaylist";

interface TrackItem {
  title: string;
  src: string;
  artist: string;
  cover: string;
}

interface PlaylistData {
  id: number;
  title: string;
  artist: string;
  timeAgo: string;
  cover: string;
  tracks: TrackItem[];
}

const PlaylistHeader: React.FC = () => {
  const { playlistId } = useParams<{ playlistId: string }>();
  const numericId = Number(playlistId);
  const playlists = getPlaylists();
  const playlist = playlists.find((pl: PlaylistData) => pl.id === numericId);

  const [isEditingTitle, setIsEditingTitle] = useState(false);
  const [newTitle, setNewTitle] = useState(playlist?.title || "");

  const [isEditingCover, setIsEditingCover] = useState(false);
  const [newCoverPreview, setNewCoverPreview] = useState<string | null>(null);

  useEffect(() => {
    const savedCover = localStorage.getItem(`playlist_${numericId}_cover`);
    if (savedCover && playlist) {
      playlist.cover = savedCover;
    }
  }, [numericId, playlist]);

  if (!playlist) {
    return <div>Không tìm thấy thông tin playlist.</div>;
  }

  const handleEditTitleClick = () => setIsEditingTitle(true);
  const handleTitleChange = (e: React.ChangeEvent<HTMLInputElement>) =>
    setNewTitle(e.target.value);
  const handleSaveTitle = () => {
    playlist.title = newTitle;
    setIsEditingTitle(false);
  };
  const handleCancelTitle = () => {
    setNewTitle(playlist.title);
    setIsEditingTitle(false);
  };

  const handleEditCoverClick = () => setIsEditingCover(true);

  const handleCoverChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = () => setNewCoverPreview(reader.result as string);
      reader.readAsDataURL(file);
    }
  };

  const handleSaveCover = () => {
    if (newCoverPreview) {
      playlist.cover = newCoverPreview;
      localStorage.setItem(`playlist_${numericId}_cover`, newCoverPreview);
    }
    setIsEditingCover(false);
    setNewCoverPreview(null);
  };

  const handleCancelCover = () => {
    setIsEditingCover(false);
    setNewCoverPreview(null);
  };

  return (
    <div className="playlist-header">
      <img
        src={newCoverPreview || playlist.cover}
        alt={playlist.title}
        className="playlist-image"
        onClick={handleEditCoverClick}
        style={{ cursor: "pointer" }}
      />

      <div className="playlist-details">
        <div className="playlist-type">Playlist</div>
        <h1 className="playlist-title" onClick={handleEditTitleClick}>
          {playlist.title}
        </h1>
        <div className="playlist-meta">
          <img src={playlist.cover} alt={playlist.artist} className="artist-image" />
          <span>{playlist.artist}</span>
          <span className="dot-separator">•</span>
          <span>{playlist.timeAgo}</span>
          <span className="dot-separator">•</span>
          <span>{playlist.tracks.length} tracks</span>
        </div>
      </div>

      {/* Modal: sửa tên */}
      {isEditingTitle && (
        <div className="modal-overlay">
          <div className="modal-content">
            <h2>Sửa tên Playlist</h2>
            <input
              type="text"
              value={newTitle}
              onChange={handleTitleChange}
              className="modal-input"
            />
            <div className="modal-actions">
              <button onClick={handleSaveTitle} className="modal-save-button">
                Lưu
              </button>
              <button onClick={handleCancelTitle} className="modal-close-button">
                Hủy
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Modal: sửa ảnh */}
      {isEditingCover && (
        <div className="modal-overlay">
          <div className="modal-content">
            <h2>Chọn ảnh mới cho Playlist</h2>
            <input type="file" accept="image/*" onChange={handleCoverChange} />
            {newCoverPreview && (
              <img
                src={newCoverPreview}
                alt="Xem trước"
                style={{ width: "200px", marginTop: "10px" }}
              />
            )}
            <div className="modal-actions">
              <button onClick={handleSaveCover} className="modal-save-button">
                Lưu
              </button>
              <button onClick={handleCancelCover} className="modal-close-button">
                Hủy
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default PlaylistHeader;
