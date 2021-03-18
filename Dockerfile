FROM fedora:32
RUN dnf install -y createrepo python3

EXPOSE 8000

COPY [ "./start_repo.sh", "/"]
ENTRYPOINT [ "/start_repo.sh" ]

