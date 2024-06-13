part of 'upload_picture_bloc.dart';

abstract class UploadPictureEvent extends Equatable {
  const UploadPictureEvent();

  @override
  List<Object> get props => [];
}

class UploadImage extends UploadPictureEvent {
  final Uint8List file;
  final String name;

  const UploadImage(this.file,this.name);

  @override
  List<Object> get props => [file,name];
}