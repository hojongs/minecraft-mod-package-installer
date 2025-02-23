import os
import shutil
import sys
from pathlib import Path

def get_minecraft_mods_dir():
    """Minecraft의 mods 디렉토리를 반환합니다."""
    if sys.platform == "win32":
        return Path(os.getenv("APPDATA")) / ".minecraft" / "mods"
    elif sys.platform == "darwin":
        return Path.home() / "Library" / "Application Support" / "minecraft" / "mods"
    else:
        return Path.home() / ".minecraft" / "mods"

def get_embedded_mods_dir():
    """PyInstaller 실행 파일 내부의 mods 디렉토리를 반환합니다."""
    if getattr(sys, 'frozen', False) and hasattr(sys, '_MEIPASS'):
        # PyInstaller 실행 파일 내부 경로
        return Path(getattr(sys, "_MEIPASS")) / "mods"
    else:
        # 개발 환경에서는 현재 디렉토리의 mods 폴더 사용
        return Path(__file__).parent / "mods"

def install_mods():
    """내장된 mods 디렉토리에서 Minecraft mods 디렉토리로 복사"""
    mods_dir = get_minecraft_mods_dir()
    embedded_mods_dir = get_embedded_mods_dir()

    mods_dir.mkdir(parents=True, exist_ok=True)

    for jar_file in embedded_mods_dir.glob("*.jar"):
        dest_file = mods_dir / jar_file.name
        shutil.copy2(jar_file, dest_file)
        print(f"Installed: {jar_file.name} -> {dest_file}")

if __name__ == "__main__":
    install_mods()
    print("모든 모드 설치 완료!")
