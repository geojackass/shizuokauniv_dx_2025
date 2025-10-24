# ------------------------------------------------
# geojackass/datascience : Python + R + GIS + PostGIS + DuckDB + Parquet
# ------------------------------------------------
FROM jupyter/minimal-notebook:latest

LABEL maintainer="SHOICHI OTOMO <geojackass.shoichi0129@gmail.com>"
LABEL description="JupyterLab with Python + R + GIS + PostGIS + DuckDB + Parquet"

USER root
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

# ---- OS依存のあるライブラリ ----
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    gdal-bin \
    libgdal-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    libpq-dev \
    r-base \
    r-base-dev \
    fonts-dejavu \
    unixodbc \
    unixodbc-dev \
    r-cran-rodbc \
    gfortran \
    gcc \
    postgresql-client && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# ---- R: kernel + permissions ----
#notebookから使えるようにする
RUN R -e "install.packages('IRkernel', repos='https://cloud.r-project.org/')" && \
    R -e "IRkernel::installspec(user = FALSE)"

RUN mkdir -p /usr/local/lib/R/site-library && \
    chown -R ${NB_UID}:${NB_GID} /usr/local/lib/R/site-library && \
    fix-permissions /usr/local/lib/R/site-library

# ---- R: essential packages + Parquet + DuckDB ----
#user権限をrootに設定してからRのライブラリインストールを行う
USER root
RUN R -e "install.packages('pacman', repos='https://cloud.r-project.org/')" && \
    R -e "pacman::p_load(sf, tidyverse, data.table, tmap, RPostgres, DBI, sp, rgdal, lwgeom, units, classInt, ggplot2, arrow, duckdb, haven)"
USER ${NB_UID}

# ---- Python packages ----
RUN pip install --no-cache-dir \
    jupyterlab==4.* \
    requests==2.31.0 \
    scipy==1.10.0 \
    osmnx==2.0.1 \
    networkx \
    shapely \
    geopandas \
    pandas \
    scikit-learn \
    pyarrow \
    fastparquet \
    duckdb \
    psycopg2-binary \
    sqlalchemy \
    folium

# ---- Permissions ----
USER root
RUN fix-permissions /home/jovyan
USER ${NB_UID}

# ---- Expose ports ----
#notebookは8888, duckdbは8765
EXPOSE 8888 8765

# ---- Default command ----
CMD ["start-notebook.sh"]