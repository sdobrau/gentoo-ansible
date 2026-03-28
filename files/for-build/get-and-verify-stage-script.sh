latest_file=$(curl -s https://distfiles.gentoo.org/releases/amd64/autobuilds/current-stage3-amd64-desktop-systemd/latest-stage3-amd64-desktop-systemd.txt | sed -n -e '6p' | awk -F" " '{print $1}')

wget https://distfiles.gentoo.org/releases/amd64/autobuilds/current-stage3-amd64-desktop-systemd/"${latest_file}" stage3-amd-64-desktop-systemd.tar.xz
wget https://distfiles.gentoo.org/releases/amd64/autobuilds/current-stage3-amd64-desktop-systemd/"${latest_file}".asc stage3-amd-64-desktop-systemd.tar.xz.asc
wget https://distfiles.gentoo.org/releases/amd64/autobuilds/current-stage3-amd64-desktop-systemd/"${latest_file}".DIGESTS stage3-amd-64-desktop-systemd.tar.xz.DIGESTS
wget https://distfiles.gentoo.org/releases/amd64/autobuilds/current-stage3-amd64-desktop-systemd/"${latest_file}".sha256 stage3-amd-64-desktop-systemd.tar.xz.sha256

gpg --verify "${latest_file}.asc" "${latest_file}"
gpg --output "${latest_file}.DIGESTS.verified" --verify "${latest_file}.DIGESTS"
gpg --output "${latest_file}.sha256.verified"  --verify "${latest_file}.sha256"
