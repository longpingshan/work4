1.
department:
#从数据文件可以看到dept_name，building为字符串且不确定字符串长度，应该选择变长字符串类型，budget为整数类型
CREATE TABLE `university`.`department` (
  `dept_name` VARCHAR(20) NOT NULL,
  `building` VARCHAR(45) NULL,
  `budget` INT UNSIGNED NULL,
  PRIMARY KEY (`dept_name`));

student:
#从数据文件可以看到dept_name，name，sex，emotion_state为字符串且不确定字符串长度，应该选择变长字符串类型，ID，age为整数类型
CREATE TABLE `university`.`student` (
  `ID` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `sex` VARCHAR(10) NULL,
  `age` INT UNSIGNED NULL,
  `emotion_state` VARCHAR(10) NULL,
  `dept_name` VARCHAR(20) NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_student_1_idx` (`dept_name` ASC),
  CONSTRAINT `fk_student_1`
    FOREIGN KEY (`dept_name`)
    REFERENCES `university`.`department` (`dept_name`)
    ON DELETE SET NULL
    ON UPDATE CASCADE);

exam:
#从数据文件可以看到exam_name为字符串且不确定字符串长度，应该选择变长字符串类型，student_ID和grade为整数类型
CREATE TABLE `university`.`exam` (
  `student_ID` INT NOT NULL,
  `exam_name` VARCHAR(45) NOT NULL,
  `grade` INT UNSIGNED NULL,
  PRIMARY KEY (`student_ID`, `exam_name`),
  CONSTRAINT `fk_exam_1`
    FOREIGN KEY (`student_ID`)
    REFERENCES `university`.`student` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


