#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "DFT.h"
#include <QFileDialog>
#include <QMessageBox>
#include <QTextCodec>
#include <QDebug>
MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    filterType = ui->comboBox->currentIndex();
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_clicked()
{
     QString filename = QFileDialog::getOpenFileName(this,tr("Open Image"),"",tr("Image File(*.bmp *.tif *.jpg *.jpeg *.png)"));
     QTextCodec *code = QTextCodec::codecForName("gb18030");
     std::string name = code->fromUnicode(filename).data();
     image = cv::imread(name,0);
     img = QImage(filename);
     if(!image.data)
     {
         QMessageBox msgBox;
         msgBox.setText(tr("image data is null"));
         msgBox.exec();
     }
     else
     {

         ui->label->setPixmap(QPixmap::fromImage(img));
         ui->label->resize(ui->label->pixmap()->size());
         ui->label->show();

         dft.getsrcImage(image);
         dft.Transform();
         dft.resultShow();

         vector<int> compression_params;
         compression_params.push_back(CV_IMWRITE_PNG_COMPRESSION);
         compression_params.push_back(9);
         imwrite("spectrum.png",dft.getdst()*255, compression_params);
         QImage fftshow("spectrum.png");
         ui->label_2->setPixmap(QPixmap::fromImage(fftshow));
         ui->label_2->resize(ui->label_2->pixmap()->size());
         ui->label_2->show();
     }

}

void MainWindow::display(cv::Mat mat)
{
    cv::Mat rgb;
    QImage img;
    //cv::cvtColor(mat, rgb, CV_GRAY2BGR);
    if(mat.channels()==3)
    {
        cv::cvtColor(mat,rgb,CV_BGR2RGB);
        img = QImage((const uchar*)(rgb.data),rgb.cols,rgb.rows,rgb.cols*rgb.channels(),QImage::Format_RGB888);
    }
    else
    {

                img = QImage( mat.data,
                            mat.cols, mat.rows,
                            static_cast<int>(mat.step),
                            QImage::Format_Grayscale8 );
    }
    ui->label->setPixmap(QPixmap::fromImage(img));

    ui->label->show();
}




void MainWindow::on_comboBox_currentIndexChanged(int index)
{

        filterType = index;
}


void MainWindow::on_filter_clicked()
{
    if(!image.data)
    {
        QMessageBox msgBox;
        msgBox.setText(tr("image data is null"));
        msgBox.exec();
    }
    else
    {
        //滤波器生成及显示
        int value = ui->horizontalSlider->value();
        dft.Filter_mask(filterType,value);
        vector<int> compression_params;
        compression_params.push_back(CV_IMWRITE_PNG_COMPRESSION);
        compression_params.push_back(9);
        imwrite("filter.png",dft.getfilter()*255, compression_params);
        QImage fftshow("filter.png");
        ui->label_3->setPixmap(QPixmap::fromImage(fftshow));
        ui->label_3->resize(ui->label_3->pixmap()->size());
        ui->label_3->show();

        //滤波结果及显示
        dft.Filter();
        vector<int> compression_params1;
        compression_params1.push_back(CV_IMWRITE_PNG_COMPRESSION);
        compression_params1.push_back(9);
        imwrite("filter_result.png",dft.getfilter_result()*255, compression_params1);
        QImage show("filter_result.png");
        ui->label_4->setPixmap(QPixmap::fromImage(show));
        ui->label_4->resize(ui->label_4->pixmap()->size());
        ui->label_4->show();
    }
}

void MainWindow::on_horizontalSlider_valueChanged()
{

        on_filter_clicked();
}
